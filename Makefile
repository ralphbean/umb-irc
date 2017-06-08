
IMAGE_NAME = umb-fedmsg-builder

build:
	docker build -t $(IMAGE_NAME) .
	docker tag umb-fedmsg-builder docker.io/threebean/umb-fedmsg-builder
	docker push docker.io/threebean/umb-fedmsg-builder

destroy:
	oc delete {bc,dc}/umb-irc is/umb-irc is/umb-fedmsg-builder

create:
	oc new-app threebean/umb-fedmsg-builder~https://github.com/ralphbean/umb-irc.git --strategy=source

#.PHONY: test
#test:
#	docker build -t $(IMAGE_NAME)-candidate .
#	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
