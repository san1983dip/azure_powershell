$storageaccount_Name = "sandipsen1263602"
$Resoursegroupname = "Sandip-RG-11" 
$locationname = "east us"

#Create a container under newly created storage a/c

$container_name = "ss1" #storage container name as per our wish.

$storageaccount_context = Get-AzStorageAccount -Name $storageaccount_Name -ResourceGroupName $Resoursegroupname #it has been createed to get the context value to main command.

New-AzStorageContainer -Name $container_name -Context $storageaccount_context.Context -Permission Blob #storage a/c creation cmdlet 

<#
===========================================================================================================
Creating a container under our storage a/c after checking
#>
$storageaccount_Name = "sandipsen1263602"
$Resoursegroupname = "Sandip-RG-11" 
$locationname = "east us"

$container_name = "ss11" #storage container name as per our wish.

$storageaccount_context = Get-AzStorageAccount -Name $storageaccount_Name -ResourceGroupName $Resoursegroupname #it has been createed to get the context value to main command.

if(Get-AzStorageContainer -Name $container_name -Context $storageaccount_context.Context -ErrorAction SilentlyContinue)
{Write-Host "Storage Container" $storageaccount_Name "already available. Kindly note the details:" }

else{
    Write-Host "Storage Container" $container_name "creating" -ForegroundColor Red
    $container = New-AzStorageContainer -Name $container_name -Context $storageaccount_context.Context -Permission Blob
    Write-Host "Storage Container" $container_name "has been created , here are the details" 
    $container

}
<#
====================================================================================
upload a file to newly created storage container "ss1". 
#>

$storageaccount_Name = "sandipsen1263602"
$Resoursegroupname = "Sandip-RG-11" 
# we have to specify the file name and location which I want to upload to the container. It should be in the form of hastable

$blob_details = @{
                objectlocation ="D:\Sandip\record.txt"
                objectname = "record.txt"
}
Set-AzStorageBlobContent -Container $container_name -Context $storageaccount_context.Context -File $blob_details['objectlocation'] -Blob $blob_details['objectname'] 

# any one of the cmd we can use to upload files to storage container.

Set-AzStorageBlobContent -Container $container_name -Context $storageaccount_context.Context -File $blob_details.objectlocation -Blob $blob_details.objectname #another way to access hash table object


