
# https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db

#
# SETUP
#

# Import development config
cnf ?= development.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# Import container config
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# Import deployment config
dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

# Grep the version
VERSION=$(shell ./version.sh)

#
# HELP
#
# Outputs the help for each task

.PHONY: help

help: ## This help message
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

#
# SETUP TASKS
#
setup: ## Clone the repo's and setup your IDE
# 	@./scripts/yaml.sh parse_yaml development.yml
# 	@echo IDE binary is $(ide_binary)
	@echo Setting up working directory
	@./scripts/make.sh create_work_dir

	@echo Cloning server repo $(repositories_server_repository) to ./work/$(repositories_server_clone)
	@./scripts/git.sh git-clone $(repositories_server_repository) ./work/$(repositories_server_clone)
	@echo Checking out branch $(repositories_server_branch)
	@./scripts/git.sh git-checkout-branch ./work/$(repositories_server_clone) $(repositories_server_branch)

#
# DOCKER TASKS
#

build: ## Build the container
	docker build -t $(APP_NAME) .

build-nc: ## Build the container without caching
	docker build --no-cache -t $(APP_NAME) .

run: ## Run the container on port configured in config.env
	docker run -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME)

up: build run ## Convenience call to build and run the container

stop: ## Stop and remove a running container
	docker stop $(APP_NAME); docker rm $(APP_NAME)

# # Docker publish
# publish: repo-login publish-latest publish-version ## Publish the `{version}` ans `latest` tagged containers to ECR

# publish-latest: tag-latest ## Publish the `latest` taged container to ECR
# 	@echo 'publish latest to $(DOCKER_REPO)'
# 	docker push $(DOCKER_REPO)/$(APP_NAME):latest

# publish-version: tag-version ## Publish the `{version}` taged container to ECR
# 	@echo 'publish $(VERSION) to $(DOCKER_REPO)'
# 	docker push $(DOCKER_REPO)/$(APP_NAME):$(VERSION)

# # Docker tagging
# tag: tag-latest tag-version ## Generate container tags for the `{version}` ans `latest` tags

# tag-latest: ## Generate container `{version}` tag
# 	@echo 'create tag latest'
# 	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest

# tag-version: ## Generate container `latest` tag
# 	@echo 'create tag $(VERSION)'
# 	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):$(VERSION)
