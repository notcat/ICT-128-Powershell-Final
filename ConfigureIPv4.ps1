<#
    .SYNOPSIS
    Configures IPv4 Connection settings 

    .DESCRIPTION
    Configures IPv4 Connection settings of a specified interface in a CLI

    .EXAMPLE
    PS> ./ConfigureIPv4.ps1
#>

Get-NetAdapter

$int = Read-Host("What Interface Index of the adaptor do you want to change?")
$ipv4 = Read-Host("What IPv4 IP Address do you want?")
$cidr = Read-Host("What is the CIDR notation of your subnet? (255.255.255.0 is a 24 CIDR notation)")
$gateway = Read-Host("What is the IPv4 Address of the Default Gateway?")

New-NetIPAddress -InterfaceIndex $int -IPAddress $ipv4 -PrefixLength $cidr -DefaultGateway $gateway

Write-Output "DONE!"