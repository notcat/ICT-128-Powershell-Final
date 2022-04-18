<#
    .SYNOPSIS
    Gets computer information

    .DESCRIPTION
    Gets the CPU, Windows version, system type, and username of the computer, and formats it into a list

    .PARAMETER username
    Specifies the user to disable.

    .EXAMPLE
    PS> ./GetComputerInformation.ps1
#>

Get-ComputerInfo | Select-Object -Property CsProcessors, CsSystemType, CsUserName, WindowsProductName | Format-List