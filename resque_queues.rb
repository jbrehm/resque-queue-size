#!/usr/bin/env ruby
# -*- mode: ruby -*-

#%# family=auto contrib
#%# capabilities=autoconf

require 'resque'
require 'optparse'
require 'socket'
require 'statsd'

@options = {:server => 'statsd', :port => 2033, :prefix => 'statsd.prefix'}
OptionParser.new do |opts|
    opts.banner = 'Usage: resque_queues.rb [options]'

    opts.on('-r', '--redis RESQUE_SERVER:PORT:DB', 'Redis server and port database for resque') { |v| @options[:redis_server] = v }
    opts.on('-s', '--server SENDCHANNEL_HOST', 'Statsd host') { |v| @options[:server] = v }
    opts.on('-p', '--port SENDCHANNEL_PORT', 'Statsd port') { |v| @options[:port] = v }
    opts.on('-e', '--prefix PREFIX', 'Statsd Prefix') { |v| @options[:prefix] = v }
end.parse!

Resque.redis = @options[:redis_server]
queues = Resque.queues
if queues.nil? || queues.empty?
    puts "no: no resque info found"
    exit(1)
end
stats = Resque.info

$statsd = Statsd.new @options[:server], @options[:port]

Resque.queues.each do |q|
    $statsd.gauge("#{@options[:prefix]}.resque_queue_size.#{q}", Resque.size(q))
end

$statsd.gauge("#{@options[:prefix]}.resque_scheduled_jobs.size", Resque.redis.hlen(:schedules))
