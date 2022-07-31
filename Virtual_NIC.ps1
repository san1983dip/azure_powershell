<#
Create a new NIC:
-resource group
-location
-available virtual network name
-available subnet name
Above information will get from --> Get-AzVirtualNetwork -name $VirtualNetworkName -ResourceGroupName $Resoursegroupname
#>

$Resoursegroupname = "Sandip-RG-11" 
$locationname = "east us"
$VirtualNetworkName = "PRD_Subnet"
$SubnetName = "PRD_APP_Subnet_1"
$Virtualnetwork_Details = Get-AzVirtualNetwork -name $VirtualNetworkName -ResourceGroupName $Resoursegroupname #collecting virtual network details
$Subnet_Detail = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $Virtualnetwork_Details #collecting subnet details

$NIC_Name = "PRDSRV1_NIC_Backend"

$NIC_Details = New-AzNetworkInterface -Name $NIC_Name -ResourceGroupName $Resoursegroupname -Location $locationname -Subnet $Subnet_Detail
$NIC_Details