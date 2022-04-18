<#
    .SYNOPSIS
    Remotely add a computer to a domain

    .DESCRIPTION
    Remotely add a computer to a domain through a CLI

    .EXAMPLE
    PS> ./RemotelyAddComputerToDomain.ps1
#>

$computername = Read-Host("What is the name of the remote computer you want to add to the domain?")
$remoteuser = Read-Host("What is the Username of an administrator account on the remote computer?")
Write-Host("------------")
$user = Read-Host("What is the administrator account of the ")
$domain = Read-Host("What is the domain name of the domain you want to join? (Example: int.company.com")
$netbios = Read-Host("What is the NETBIOS of the domain that you want to join the remote computer to?")

Add-Computer -ComputerName $computername -LocalCredential $computername\$remoteuser -DomainName $domain -Credential $netbios\$user -Restart