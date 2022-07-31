Connect-Azaccount

$Resoursegroupname = "Sandip-RG-1"
$locationname = "east us"
New-AzResourceGroup -Name $Resoursegroupname -Location $locationname
