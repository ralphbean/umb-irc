
IMAGE_NAME = umb-irc

build:
	docker build -t $(IMAGE_NAME) .

#.PHONY: test
#test:
#	docker build -t $(IMAGE_NAME)-candidate .
#	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
