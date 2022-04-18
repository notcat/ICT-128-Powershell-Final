<#
    .SYNOPSIS
    Gets processes on the system

    .DESCRIPTION
    Gets processes on the system and exports them to an HTML file in the same working directory folder

    .EXAMPLE
    PS> ./GetProccessToHTML.ps1
#>

Get-Process | ConvertTo-HTML -Property Name, Status > ./processes.html