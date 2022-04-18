<#
    .SYNOPSIS
    Gets all the users in the AD group specified

    .DESCRIPTION
    Gets all the users in the AD group specified

    .PARAMETER group
    Specifies the group

    .EXAMPLE
    PS> ./GetUsersInADGroup.ps1 -group ITAdmins
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $group
)

Get-ADGroupMember -Identity $group | Select-Object Name