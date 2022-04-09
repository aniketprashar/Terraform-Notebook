# Azure Terraform

## Basic Structure

`main.tf` - main configuration file
`variables.tf` - variables used for deployment
`terraform.tfvars` - update variable settings. Name must be terraform.tfvars. For custom name use `*.auto.tfvars`
`locals.tf` - Assign a name to an expression like company name which doesn't need to be changed frequently but will have many instances which can be changed at once. Overuse can make code difficult to read
`output.tf` - Shows output value

## Terraform Commands V1

- `az login`
- `az account set -s {subscription_id}` or "{Subscription Name}"
- `az account show`
- `terraform init`
- `terraform init -backend-config=backend.tfvars`
- `terraform plan` (optional step)
- `terraform apply`

## Terraform Commands V2

- `terraform fmt` - formats the terraform configuration files in canonical format.
- `terraform validate` - validated the terraform configuration files.
- `terraform providers` - print tree of all the providers used in the configuration.
- `terraform show` - inspect the terraform state or plan file
- `terraform plan -out=newplan` - save the plan
- `terraform apply "newplan"` - apply it in next step
- `terraform apply -auto-approve` - silently apply changes
- `terraform output` - shows output variables in the console

## Terraform Commands V3

- `terraform plan -destroy` - destroy resources in sequential way; decides which resource needs to be removed first.
- `terraform destroy` - same as terraform apply
- `terraform destroy -auto-approve` - silently destroys the resources without any prompt.
- `terraform destroy -target=azurerm_resource_group.rg` - It will delete the Resource Group

## Terraform Commands V4

- `terraform taint azurerm_storage_account.sa` - marks the storage account as tainted which means this storage account will be destroyed and then recreated. Perform terraform plan and apply after tainting the resources.
- `terraform untaint azurerm_storage_account.sa` - untaints the storage account.
- `terraform import {Terraform_id} {storage account resource id to be imported}` - Imports the existing azure resource to terraform state file.
- `Terraform graph | dot -Tsvg > default.svg` - Creates a dependency graph in svg format.

## Terraform Commands V5

- `terraform workspace list` - list all workspaces in the directory
- `terraform workspace new Dev` - creates a new workspace called Dev
- `terraform workspace select Dev` - selects the workspace called Dev to work on.
- `terraform apply -var-file=Dev.tfvars` - different environments will have different argument files.

## Terraform Functions

- Concatination:
  - `join("", ["Aniket", "Prashar"])` Output= AniketPrashar
  - `join(", ", ["Aniket", "Prashar"])` Output= Aniket, Prashar
  - `${variable_name}-Aniket` where variable_name="Prashar" Output= Prashar-Aniket
- Conditional Operator - `condition ? truevalue : falsevalue`
  - Example - `subnet="${var.env=="prod" ? var.prod-subnet : var.dev-subnet}"`

## Misclaneous

- No need to define terraform provider in each terraform file in the same directory
- As terraform runs in a working directory, it plans and applies the configuration based on all the configuration files in the directory. So it is a good practice to split the code into multiple config files.
- Different ways of storing state file in storage account
  - Using Azure CLI or Service principal
  - Using MSI
  - Using SAS token
  - Using access key of storage account
- Backend block doesn't support interpolation of values because terraform wants the backend to be initialized before hand, so there is a command to pass during the runtime.
- `terraform output -json` - if we have to pass the output value to automation, it will unhide the sensative values and pass it for automation.
- `terraform plan -var-file="dev.tfvars` - provides variable file for different environments.
- `terraform plan -var="variable_name=Variable-Value"` - pass variables using command line arguments. Precedence is `terraform.tfvars` > `*.auto.tfvars` > `-var` command line argument.
