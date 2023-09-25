### Generic Variables
SHELL := /bin/zsh

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

################################################################################
# Site 101
################################################################################

.PHONY: build-site-101
build-site-101: ## Build site 101 configuration and documentation
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags build -i inventory/Site_101/inventory.yml --diff

.PHONY: provision-site-101
provision-site-101: ## Build site 101 configuration and documentation and provision on CVP without executing the tasks
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags provision -i inventory/Site_101/inventory.yml --diff

.PHONY: deploy-site-101
deploy-site-101: ## Build site 101 configuration and documentation and deloy on the network through CVP
	ansible-playbook playbooks/cvp-fabric-deploy.yml --extra-vars "execute_tasks=true" --tags "build,provision,apply" -i inventory/Site_101/inventory.yml --diff

.PHONY: validate-site-101
validate-site-101: ## Run AVD fabric validate role on site 101
	ansible-playbook playbooks/fabric-validate-state.yml -i inventory/Site_101/inventory.yml --diff

################################################################################
# Site 102
################################################################################

.PHONY: build-site-102
build-site-102: ## Build site 102 configuration and documentation
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags build -i inventory/Site_102/inventory.yml --diff

.PHONY: provision-site-102
provision-site-102: ## Build site 102 configuration and documentation and provision on CVP without executing the tasks
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags provision -i inventory/Site_102/inventory.yml --diff

.PHONY: deploy-site-102
deploy-site-102: ## Build site 102 configuration and documentation and deloy on the network through CVP
	ansible-playbook playbooks/cvp-fabric-deploy.yml --extra-vars "execute_tasks=true" --tags "build,provision,apply" -i inventory/Site_102/inventory.yml --diff

.PHONY: validate-site-102
validate-site-102: ## Run AVD fabric validate role on site 102
	ansible-playbook playbooks/fabric-validate-state.yml -i inventory/Site_102/inventory.yml --diff

################################################################################
# Site 103
################################################################################

.PHONY: build-site-103
build-site-103: ## Build site 103 configuration and documentation
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags build -i inventory/Site_103/inventory.yml --diff

.PHONY: provision-site-103
provision-site-103: ## Build site 103 configuration and documentation and provision on CVP without executing the tasks
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags provision -i inventory/Site_103/inventory.yml --diff

.PHONY: deploy-site-103
deploy-site-103: ## Build site 103 configuration and documentation and deloy on the network through CVP
	ansible-playbook playbooks/cvp-fabric-deploy.yml --extra-vars "execute_tasks=true" --tags "build,provision,apply" -i inventory/Site_103/inventory.yml --diff

.PHONY: validate-site-103
validate-site-103: ## Run AVD fabric validate role on site 103
	ansible-playbook playbooks/fabric-validate-state.yml -i inventory/Site_103/inventory.yml --diff

################################################################################
# Site 104
################################################################################

.PHONY: build-site-104
build-site-104: ## Build site 104 configuration and documentation
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags build -i inventory/Site_104/inventory.yml --diff

.PHONY: provision-site-104
provision-site-104: ## Build site 104 configuration and documentation and provision on CVP without executing the tasks
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags provision -i inventory/Site_104/inventory.yml --diff

.PHONY: deploy-site-104
deploy-site-104: ## Build site 104 configuration and documentation and deloy on the network through CVP
	ansible-playbook playbooks/cvp-fabric-deploy.yml --extra-vars "execute_tasks=true" --tags "build,provision,apply" -i inventory/Site_104/inventory.yml --diff

.PHONY: validate-site-104
validate-site-104: ## Run AVD fabric validate role on site 104
	ansible-playbook playbooks/fabric-validate-state.yml -i inventory/Site_104/inventory.yml --diff
