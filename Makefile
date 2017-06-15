
IMAGE_NAME = umb-irc

build:
	docker build -t $(IMAGE_NAME) .

destroy:
	oc delete {bc,dc,is}/umb-irc-{dev,stage,prod}

create:
	oc new-app https://github.com/ralphbean/umb-irc.git \
		--strategy=docker \
		-e UMB_USERNAME=admin \
		-e UMB_PASSWORD=admin_pwd_dev \
		--name umb-irc-dev \
		-e UMB_ENVIRON=dev \
		-e UMB_URI=messaging-devops-broker01.dev1.ext.devlab.redhat.com:61612,messaging-devops-broker02.dev1.ext.devlab.redhat.com:61612
	oc volume dc/umb-irc-dev --add --type secret --secret-name umb-dev-certs --mount-path=/secrets/
	oc new-app https://github.com/ralphbean/umb-irc.git \
		--strategy=docker \
		-e UMB_USERNAME=admin \
		-e UMB_PASSWORD=admin_pwd_dev \
		--name umb-irc-stage \
		-e UMB_ENVIRON=stage \
		-e UMB_URI=messaging-devops-broker01.web.stage.ext.phx2.redhat.com:61612,messaging-devops-broker02.web.stage.ext.phx2.redhat.com:61612
	oc volume dc/umb-irc-stage --add --type secret --secret-name umb-stage-certs --mount-path=/secrets/
	oc new-app https://github.com/ralphbean/umb-irc.git \
		--strategy=docker \
		-e UMB_USERNAME=admin \
		-e UMB_PASSWORD=admin_pwd_dev \
		--name umb-irc-prod \
		-e UMB_ENVIRON=prod \
		-e UMB_URI=messaging-devops-broker01.web.prod.ext.phx2.redhat.com:61612,messaging-devops-broker02.web.prod.ext.phx2.redhat.com:61612 
	oc volume dc/umb-irc-prod --add --type secret --secret-name umb-prod-certs --mount-path=/secrets/
