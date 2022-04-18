<#
    .SYNOPSIS
    Gets all the computers on the AD Domain

    .DESCRIPTION
    Gets all the computers on the AD Domain

    .EXAMPLE
    PS> ./GetComputersOnADDomain.ps1
#>

Get-adcomputer -properties * -filter *