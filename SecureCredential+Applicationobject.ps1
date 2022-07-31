
<## what we have done to this script is 
- command will not cache azure portal login from local system 
- we will login to the portal using "Application object" which is in tern "service principle"
- very importetn - we have to allow the "Application object" to create resources under my subscription. we can grant this as resource group level also. to acive this 
we need to go subscription - select my targeted subscription - Access control (IAM) - Add - "Add Role Asignment" - select the role [here it's contributer] - 
select your "application object name from drop down and complete the process."
#>
Disable-AzContextAutosave # command will not cache azure portal login from local system

$Resoursegroupname = "Sandip-RG-11" 
$locationname = "east us"
$appid = "d6bea177-f588-486e-a2c7-1bf28e27680e" #available at azure portal. To the overview page of application object avaialble saying "client id"

$appsecret = "Cq28Q~7vy_pNV6Z3nKV.PtECta.jGrBX1hrRJdeK" #available at azure portal.Go to azureAD - under manage section "certificates&secrets" create "New client secret".its for one time use only

$securesecret = $appsecret | ConvertTo-SecureString -AsPlainText -Force # we can't supply normal test as password so we are converting $appsecret to secure string which we will supply as password with credential.

$tenentid = "0645a6c1-4572-409c-8036-0107c1b807ae" #Go to the overview page of "Application object - Directory (tenant) ID"

$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $appid,$securesecret # we are creating the credetial here. "System.Management.Automation.PSCredential" is the .net object

Connect-Azaccount -ServicePrincipal -Credential $credential -Tenant $tenentid 

New-AzResourceGroup -Name $Resoursegroupname -Location $locationname