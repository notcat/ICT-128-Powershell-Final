<#
    .SYNOPSIS
    Gets all Windows apps

    .DESCRIPTION
    Gets all Windows apps

    .EXAMPLE
    PS> ./GetAllWindowsApps.ps1
#>


Get-AppxPackage -AllUsers | Select-Object Name, PackageFullName | Format-Table