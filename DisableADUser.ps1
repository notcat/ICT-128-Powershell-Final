<#
    .SYNOPSIS
    Disables a AD User

    .DESCRIPTION
    Disables a AD User

    .PARAMETER username
    Specifies the user to disable.

    .EXAMPLE
    PS> ./DisableADUser.ps1 -user dellenton
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $username
)

Disable-ADAccount -Identity $username