VERSION = 0.0.1 
IMAGE_NAME ?= amaysim/env-to-gocd:$(VERSION)
TAG = v$(VERSION)

dockerBuild:
	docker build -t $(IMAGE_NAME) .
	docker build -t amaysim/env-to-gocd:latest .

ecrLogin:
	$(shell aws ecr get-login --no-include-email --region ap-southeast-2)

dockerPush: ecrLogin
	docker push $(IMAGE_NAME)

shell:
	docker-compose down
	docker-compose run --rm shell

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
