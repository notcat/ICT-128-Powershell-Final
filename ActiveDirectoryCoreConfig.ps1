#
# Windows PowerShell script for AD DS Deployment
#

# By Damon Ellenton

$domain_name = Read-Host "Enter the bounded namespace (int.company.com)"
$netbios_name = Read-Host "Enter the NetBIOS name"

Write-Host "You will now be prompted for the Directory Services Restore Mode"

Import-Module ADDSDeployment
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName $domain_name `
    -DomainNetbiosName $netbios_name `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true
