1. vnet.tf (Virtual Network and Subnets)


vnet.tf
v2
provider "azurerm" {
  features {}
}

# Define the Virtual Network
resource "azurerm_virtual_network" "vnet" {
2. vm.tf (Virtual Machines with Private IPs)


vm.tf
v3
# Define a list of VMs as input
variable "vms" {
  type = list(object({
    name       = string
    subnet_id  = string
    admin_user = string
3. main.tf (Entry Point)


main.tf
v5
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
Key Improvements

No Hardcoded Passwords:

SSH keys are used instead of passwords for VM authentication.
SSH public keys are passed securely to the vm_list variable.
Dynamic VM Creation:

Additional VMs can be added to the vm_list variable in main.tf.
Best Practices:

Terraform variables and modules are used for modularity and scalability.
Sensitive data (e.g., SSH keys) is referenced securely.
Steps to Add More VMs

To add more VMs:

Update the vm_list variable in main.tf with details for the new VM:

HCL
{
  name       = "lab-vm"
  subnet_id  = module.vnet.lab_subnet_id
  admin_user = "labadmin"
  ssh_key    = file("~/.ssh/id_rsa.pub")
}
Run Terraform commands:

bash
terraform init      # Initialize Terraform
terraform plan      # Preview the changes
terraform apply     # Apply the changes
