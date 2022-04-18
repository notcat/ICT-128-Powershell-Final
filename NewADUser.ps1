<#
    .SYNOPSIS
    Creates a AD User

    .DESCRIPTION
    Creates a AD User

    .PARAMETER name
    Specifies the first name of the user

    .PARAMETER username
    Specifies the username of the new user

    .PARAMETER password
    Specifies the password

    .EXAMPLE
    PS> ./DisableADUser.ps1 -user dellenton
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $name,
    [string]
    $username,
    [string]
    $password
)

New-ADUser -Name $name -SamAccountName $username -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -ChangePasswordAtLogon $True -Enabled $True

