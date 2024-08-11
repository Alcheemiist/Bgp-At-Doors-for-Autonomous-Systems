# Makefile to (re)build and clean docker images

all: build

build:
	docker build --file=eelaazmi_host-1 --tag=eelaazmi_host .
	echo "Alpine image is built"\

	docker build --file=eelaazmi_router-1 --tag=eelaazmi_router .
	echo "Router FFS image is build"

clean:
	yes | docker image prune -a
vs : 
	docker images

re: clean all

.PHONY: all build clean re
