# Udeamy Assesment -1
# Then create three containers named containera , containerb and containerc in the storage account.
$storageaccount_Name = "sandipsen1263602"
$Resoursegroupname = "Sandip-RG-11" 
$locationname = "east us"

$container_names = Get-Content -Path "D:\Sandip\Study\Powershell\Scripts\Containers.txt" #storage container name as per our wish.

$storageaccount_context = Get-AzStorageAccount -Name $storageaccount_Name -ResourceGroupName $Resoursegroupname #it has been createed to get the context value to main command.

foreach ($container_name in $container_names) {
    
if(Get-AzStorageContainer -Name $container_name -Context $storageaccount_context.Context -ErrorAction SilentlyContinue)
{Write-Host "Storage Container" $container_name "already available." -ForegroundColor Red 
$show_containers = Get-AzStorageContainer -Context $storageaccount_context.Context

}

else{
    Write-Host "Storage Container" $container_name "creating" -ForegroundColor Red
    $container = New-AzStorageContainer -Name $container_name -Context $storageaccount_context.Context -Permission Blob
    Write-Host "Storage Container" $container_name "has been created , here are the details" 
    $container
    

}}
$show_containers
#Remove container one by one
Remove-AzStorageContainer -Name 'containerc'  -Context $storageaccount_context.Context -Verbos #Name has to specify one by one.