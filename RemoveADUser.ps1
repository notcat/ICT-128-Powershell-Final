<#
    .SYNOPSIS
    Removes a AD User

    .DESCRIPTION
    Removes a AD User

    .PARAMETER username
    Specifies the user to remove.

    .EXAMPLE
    PS> ./RemoveADUser.ps1 -user dellenton
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $username
)

Remove-ADUser $username