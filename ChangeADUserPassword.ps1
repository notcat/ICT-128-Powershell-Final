<#
    .SYNOPSIS
    Changes a AD users' password

    .DESCRIPTION
    Changes the password of an AD user

    .PARAMETER user
    Specifies the user to change

    .PARAMETER newPass
    The new password

    .EXAMPLE
    PS> ./ChangeADUserPassword.ps1 -user dellenton -newPass Password123123
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $user,
    [string]
    $newPass
)

Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$newPass" -Force)