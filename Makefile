GITHUB_LATEST_VERSION=$(shell curl https://api.github.com/repos/GoMetric/opcache-dashboard/releases/latest 2>/dev/null | grep tag_name | awk -F'"' '{print $$4}')

default: docker-build

# to publish to docker registry we need to be logged in
docker-login:
    ifdef DOCKER_REGISTRY_USERNAME
		@echo "Logged in to Docker Hub as " $(DOCKER_REGISTRY_USERNAME)
    else
		docker login
    endif

# build docker image from latest github tag
docker-build:
	@echo "Building docker image version: " $(GITHUB_LATEST_VERSION)
	docker build \
		--tag gometric/opcache-dashboard:$(GITHUB_LATEST_VERSION) \
		--tag gometric/opcache-dashboard:latest \
		--build-arg VERSION=$(GITHUB_LATEST_VERSION) \
		-f ./Dockerfile .


docker-publish: docker-login
	docker push gometric/opcache-dashboard:latest
	docker push gometric/opcache-dashboard:$(GITHUB_LATEST_VERSION)
