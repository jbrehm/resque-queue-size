.PHONY:	build push

PREFIX=391470681111.dkr.ecr.us-east-1.amazonaws.com/reverbnation
PROJECT=$(shell basename $(CURDIR))
TAG=$(shell git rev-parse --short=11 HEAD)

build:
	docker build --pull -t $(PREFIX)/$(PROJECT):$(TAG) -t $(PREFIX)/$(PROJECT):latest .

push:
	docker push $(PREFIX)/$(PROJECT):$(TAG)
	docker push $(PREFIX)/$(PROJECT):latest
