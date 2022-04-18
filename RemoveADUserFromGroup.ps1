<#
    .SYNOPSIS
    Removes a user from a group

    .DESCRIPTION
    Removes a user from a group

    .PARAMETER group
    Specifies the user to disable.
    
    .PARAMETER username
    Specifies the user to disable.

    .EXAMPLE
    PS> ./RemoveADUserFromGroup.ps1 -group ITAdmins -user dellenton
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $group,
    [string]
    $username
)

Remove-AdGroupMember -Identity $group -Members $username