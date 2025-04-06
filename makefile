dev:
	terraform workspace select dev
prod:
	terraform workspace select prod

create-dev:
	terraform workspace new dev
create-prod:
	terraform workspace new prod

init-dev: dev
	terraform init
init-prod: prod
	terraform init

plan-dev: dev
	terraform plan -var-file="dev.tfvars" -var-file="dev-secrets.tfvars"
plan-prod: prod
	terraform plan -var-file="prod.tfvars" -var-file="prod-secrets.tfvars"

apply-dev: dev
	terraform apply -auto-approve -var-file="dev.tfvars" -var-file="dev-secrets.tfvars"
apply-prod: prod
	terraform apply -auto-approve -var-file="prod.tfvars" -var-file="prod-secrets.tfvars"

destroy-dev: dev
	terraform destroy -auto-approve -var-file="dev.tfvars" -var-file="dev-secrets.tfvars"
destroy-prod: prod
	terraform destroy -auto-approve -var-file="prod.tfvars" -var-file="prod-secrets.tfvars"
