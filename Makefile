# -------------------------------------
# Project Commands
# -------------------------------------

.DEFAULT_GOAL := help

TAG := ""
VERSION := 2

.PHONY: build
build:  ## Build an image (takes options, see help)
ifeq (${TAG}, "")
	docker build -f v${VERSION}/Dockerfile -t blitzagency/python-web:${VERSION} v${VERSION}/
else
	docker build -f v${VERSION}/${TAG}/Dockerfile -t blitzagency/python-web:${VERSION}-${TAG} v${VERSION}/${TAG}
endif

.PHONY: push
push:  ## Push an image (takes options, see help)
ifeq (${TAG}, "")
	docker push blitzagency/python-web:${VERSION}
else
	docker push blitzagency/python-web:${VERSION}-${TAG}
endif



# -------------------------------------
# Makefile Documentation
# -------------------------------------
# See: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

.PHONY: help
help: help-commands help-usage help-examples ## This help dialog

.PHONY: help-commands
help-commands:
	@echo "\nCommands:"
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


# Update this target to add additional usage
.PHONY: help-usage
help-usage:
	@echo "\nUsage:"
	@echo "make <command> [Options...]"
	@echo "make build VERSION=<version_number> [TAG=<tag_name>]"
	@echo "make push VERSION=<version_number> [TAG=<tag_name>]"

# Update this target to add additinoal examples
.PHONY: help-examples
help-examples:
	@echo "\nExamples:"
	@echo "make build VERSION=3"
	@echo "make build VERSION=3 TAG=geo"
	@echo "make push VERSION=3"
	@echo "make push VERSION=3 TAG=geo"
	@echo ""

# -------------------------------------
# Prompts
# -------------------------------------
# See: http://stackoverflow.com/a/14316012 (user confirmation snippet)

# Usage Example:
#
# .PHONY ask-message
# ask-messages:
# 	@echo "About to do a thing."
#
# .PHONY ask
# ask: ask-message confirm
# 	@echo "Did a thing!"
#

.PHONY: confirm
confirm:
	@while [ -z "$$CONTINUE" ]; do \
		read -r -p "Continue? [y/N] " CONTINUE; \
	done ; \
	if [ ! $$CONTINUE == "y" ]; then \
	if [ ! $$CONTINUE == "Y" ]; then \
		echo "Exiting." ; exit 1 ; \
	fi \
	fi
