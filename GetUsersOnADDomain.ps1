<#
    .SYNOPSIS
    Get all the users on the AD Domain

    .DESCRIPTION
    Get all the users on the AD Domain

    .EXAMPLE
    PS> ./GetUsersOnADDomain.ps1
#>

Get-aduser -properties * -filter *