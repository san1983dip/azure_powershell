
# Create storage account directly
$storageaccount_Name = "sandipsen1263602"
$storageaccount_Kind = "storageV2"
$storageaccount_SKU = "standard_LRS"
$Resoursegroupname = "Sandip-RG-11" 
$locationname = "east us"

$storageaccount = New-AzStorageAccount -ResourceGroupName $Resoursegroupname -Name $storageaccount_Name -Location $locationname `
 -Kind $storageaccount_Kind -SkuName $storageaccount_SKU

$storageaccount


<#
=======================================================================================================================
we will check if storage a/c is available or not. If not there it will create the storage a/c 
#>
#$storageaccount_Name = "sandipsen1263602teat" #we can get the value from terminal using "Read-host"
$storageaccount_Name = Read-host "Type a Storage account name of your choise "
$storageaccount_Kind = "storageV2"  #we can get the value from terminal using "Read-host"
$storageaccount_SKU = "standard_LRS"    #we can get the value from terminal using "Read-host"
$Resoursegroupname = "Sandip-RG-11"     #we can get the value from terminal using "Read-host"
$locationname = "east us"

if(Get-AzStorageAccount -Name $storageaccount_Name -ResourceGroupName $Resoursegroupname -ErrorAction SilentlyContinue)
{
    Write-Host "Storage Account" $storageaccount_Name "already available. Kindly note the details:" -ForegroundColor Green
    $storageaccount
}

else {
    Write-Host "storage Account" $storageaccount_Name "creating" -ForegroundColor Red
    $storageaccount = New-AzStorageAccount -ResourceGroupName $Resoursegroupname -Name $storageaccount_Name `
-Location $locationname -Kind $storageaccount_Kind -SkuName $storageaccount_SKU
    Write-Host "Storage Account" $storageaccount_Name "has been created , here are the details" -ForegroundColor Green
    $storageaccount
}


# Remove storage account
Remove-AzStorageAccount -Name $storageaccount_Name -ResourceGroupName $Resoursegroupname -Force -Verbose