# Makefile to (re)build and clean docker images

all: build

build:
	docker build --file=eelaazmi_router-1 --tag=eelaazmi_first_router . && echo -e "Router Frr First image is built"\

	docker build --file=eelaazmi_router-2 --tag=eelaazmi_seconde_router . && echo -e "Router Frr Seconde image is built"\

clean:
	yes | docker image prune -a

re: clean all

.PHONY: all build clean re
