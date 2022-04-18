<#
    .SYNOPSIS
    Gets hotfixes installed on the machine

    .DESCRIPTION
    Gets hotfixes installed on the machine

    .EXAMPLE
    PS> ./GetHotFixesKB.ps1
#>

wmic qfe list

# Alternative but with different formatting
#Get-HotFix