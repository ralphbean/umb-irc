
IMAGE_NAME = umb-irc

build:
	docker build -t $(IMAGE_NAME) .

destroy:
	oc delete {bc,dc}/umb-irc is/umb-irc dc/umb-irc-{dev,stage,prod}

create:
	oc new-app https://github.com/ralphbean/umb-irc.git --strategy=docker
	oc delete dc/umb-irc
	oc create deploymentconfig umb-irc-dev --image umb-irc
	#oc create deploymentconfig umb-irc-stage --image umb-irc
	#oc create deploymentconfig umb-irc-prod --image umb-irc
	oc volume dc/umb-irc-dev --add --type secret --secret-name umb-dev-certs --mount-path=/secrets/
	oc env dc/umb-irc-dev UMB_USERNAME=unused
	oc env dc/umb-irc-dev UMB_PASSWORD=unused
	oc env dc/umb-irc-dev UMB_ENVIRON=dev
	oc env dc/umb-irc-dev UMB_URI=messaging-devops-broker01.dev1.ext.devlab.redhat.com:61612,messaging-devops-broker02.dev1.ext.devlab.redhat.com:61612
	#oc volume dc/umb-irc-stage --add --type secret --secret-name umb-stage-certs --mount-path=/secrets/
	#oc env dc/umb-irc-stage UMB_USERNAME=unused
	#oc env dc/umb-irc-stage UMB_PASSWORD=unused
	#oc env dc/umb-irc-stage UMB_ENVIRON=stage
	#oc env dc/umb-irc-stage UMB_URI=messaging-devops-broker01.web.stage.ext.phx2.redhat.com:61612,messaging-devops-broker02.web.stage.ext.phx2.redhat.com:61612
	#oc volume dc/umb-irc-prod --add --type secret --secret-name umb-prod-certs --mount-path=/secrets/
	#oc env dc/umb-irc-prod UMB_USERNAME=unused
	#oc env dc/umb-irc-prod UMB_PASSWORD=unused
	#oc env dc/umb-irc-prod UMB_ENVIRON=prod
	#oc env dc/umb-irc-prod UMB_URI=messaging-devops-broker01.web.prod.ext.phx2.redhat.com:61612,messaging-devops-broker02.web.prod.ext.phx2.redhat.com:61612
