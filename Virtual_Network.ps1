<#Creation of Virtual network
-resource group
-location
-name of the Virtual network
-ip address range of Virtual network
-subnet info (name,ip range)
-
#>
$Resoursegroupname = "Sandip-RG-11" 
$locationname = "east us"
$VirtualNetworkName = "PRD_Subnet"
$VirtualNetworkAddressSpace = "11.0.0.0/16"
$SubnetName = "PRD_APP_Subnet_1"
$SubnetAddressSpace = "11.0.0.0/24"

#Crete the subnet address. In the portal during creation of Virtual netwok this subnet creats but in script we have to create it first before approching to Virtual network.

$PRD_APP_Subnet_1 = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressSpace

# Create Virtual network

$Production_subnet1 = New-azvirtualnetwork -Name $VirtualNetworkName -ResourceGroupName $Resoursegroupname -Location $locationname -AddressPrefix $VirtualNetworkAddressSpace -Subnet $PRD_APP_Subnet_1

Write-Host "Virtaul network details are as follows" 
$Production_subnet1