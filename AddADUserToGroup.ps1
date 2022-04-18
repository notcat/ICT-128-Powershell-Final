<#
    .SYNOPSIS
    Adds a AD User to a group

    .DESCRIPTION
    Adds a AD User to a specified group

    .PARAMETER group
    Specifies the group to add the user to

    .PARAMETER username
    Specifies the user to add to the group

    .EXAMPLE
    PS> ./AddADUserToGroup.ps1 -group ITAdmins -user dellenton
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $group,
    [string]
    $username
)


Add-AdGroupMember -Identity $group -Members $username