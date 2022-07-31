#Create an Azure Gen2 Data Lake Storage Account. Create a container. Create a directory in the container. And then upload a file to the directory.[Not my script]

$AccountName = "datalake57677"
$AccountKind="StorageV2"
$AccountSKU="Standard_LRS"
$ResourceGroupName="powershell-grp"
$Location = "North Europe"

$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName `
-Location $Location -Kind $AccountKind -SkuName $AccountSKU -EnableHierarchicalNamespace $true #-EnableHierarchicalNamespace $true is the option to enable Azure Gen2 Data Lake Storage Account

# Create a container in the storage account
$ContainerName="data"
New-AzStorageContainer -Context $StorageAccount.Context -Name $ContainerName

# Creating a directory to the storage account

$DirectoryName="files"

New-AzDataLakeGen2Item -Context $StorageAccount.Context `
-FileSystem $ContainerName -Path $DirectoryName -Directory

# Uploading a file to the directory

$FileName="init.sql"
$CompleteStoragePath="files\init.sql"

New-AzDataLakeGen2Item -Context $StorageAccount.Context `
-FileSystem $ContainerName -Path $CompleteStoragePath `
-Source $FileName -Force