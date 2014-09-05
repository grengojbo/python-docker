IMAGE=grengojbo/python
NAME=python

all: build

build:
	docker build -t ${IMAGE} .

shell:
	docker run --rm -it -v /storage/build:/storage/build --name ${NAME}-build -e NAME_APP=${NAME} ${IMAGE} /bin/bash

clean:
	docker rmi ${IMAGE}

push:
	@docker push ${IMAGE}

pull:
	@docker pull ${IMAGE}

.PHONY: all clean shell build push pull
