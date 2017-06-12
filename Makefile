
IMAGE_NAME = umb-irc

build:
	docker build -t $(IMAGE_NAME) .

destroy:
	oc delete {bc,dc}/umb-irc is/umb-irc is/umb-fedmsg-builder

create:
	oc new-app threebean/umb-fedmsg-builder~https://github.com/ralphbean/umb-irc.git --strategy=docker
	oc volume dc/umb-irc --add --type secret --secret-name umb-dev-certs --mount-path=/secrets/
	oc env dc/umb-irc UMB_USERNAME=admin
	oc env dc/umb-irc UMB_PASSWORD=admin_pwd_dev

#.PHONY: test
#test:
#	docker build -t $(IMAGE_NAME)-candidate .
#	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
