# Makefile to (re)build and clean docker images

all: build

build:
	docker build --file=eelaazmi_host-1 --tag=eelaazmi_first_host . && echo "Host Alpine First image is built\n"\
    
	docker build --file=eelaazmi_host-2 --tag=eelaazmi_second_host . && echo "Host Alpine Second image is built\n"\

clean:
	yes | docker image prune -a

vs: 
	docker images
	
re: clean all

.PHONY: all build clean re
