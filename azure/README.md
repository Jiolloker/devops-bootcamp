# Commands
## Install azure-cli linux

sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_REPO=$(lsb_release -cs)
echo "deb [arch='dpkg --print-architecture' signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt sources.list.d/azure-cli.list

sudo apt-get update
sudo apt-get install azure-cli

Oficial Microsoft instalation site [azure-cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

## Configure terraform

3326ea6d-951a-4e84-9485-17dd934163e5


# Links

Microsoft learning path [Azure Fundamentals](https://learn.microsoft.com/en-us/certifications/azure-fundamentals/)
AZ-900T00-A: Microsoft Azure Fundamentals [AZ-900T00-A](https://learn.microsoft.com/training/courses/az-900t00?WT.mc_id=ilt_partner_webpage_wwl&ocid=3297024#study-guide)
Configure terraform with Azure [terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)|
Free services [Azure free services](https://portal.azure.com/#view/Microsoft_Azure_Billing/FreeServicesBlade)
Workshop terraform with Azure [TF Azure workshop](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build)