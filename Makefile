### Generic Variables
SHELL := /bin/zsh

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

################################################################################
# Single fabric
################################################################################

.PHONY: fabric-build
fabric-build: ## Build fabric configuration and documentation
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags build -i inventory/MPLS_network/inventory.yml --diff

.PHONY: fabric-provision
fabric-provision: ## Build fabric configuration and documentation and provision on CVP without executing the tasks
	ansible-playbook playbooks/cvp-fabric-deploy.yml --tags provision -i inventory/MPLS_network/inventory.yml --diff

.PHONY: fabric-deploy
fabric-deploy: ## Build fabric configuration and documentation and deloy on the network through CVP
	ansible-playbook playbooks/cvp-fabric-deploy.yml --extra-vars "execute_tasks=true" --tags "build,provision,apply" -i inventory/MPLS_network/inventory.yml --diff

.PHONY: fabric-validate
fabric-validate: ## Run AVD fabric validate role
	ansible-playbook playbooks/fabric-validate-state.yml -i inventory/MPLS_network/inventory.yml --diff
