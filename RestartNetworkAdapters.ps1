<#
    .SYNOPSIS
    Restarts all Network Adaptors

    .DESCRIPTION
    Restarts all Network Adaptors
    Needs admin!

    .EXAMPLE
    PS> ./RestartNetworkAdapters.ps1
#>

Write-Host("This script needs admin!")
Get-NetAdapter | Restart-NetAdapter