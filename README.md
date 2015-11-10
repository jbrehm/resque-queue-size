Pulls resque queue sizes and sends them off to statsd.

```
Usage: resque_queues.rb [options]
    -r RESQUE_SERVER:PORT:DB,        Redis server and port database for resque
        --redis
    -s, --server SENDCHANNEL_HOST    Statsd host
    -p, --port SENDCHANNEL_PORT      Statsd port
    -e, --environment ENV            Environment
    -n, --name STATS_PREFIX          Prefix for statsd
```
