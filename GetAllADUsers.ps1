<#
    .SYNOPSIS
    Gets all AD Users

    .DESCRIPTION
    Gets all AD Users

    .EXAMPLE
    PS> ./GetAllADUsers.ps1
#>

Get-ADUsers -Filter * -SearchBase "OU=Users,DC=example,DC=com" | Select-Object sAMAccountName, givenName | export-csv -path C:\Scripts\ADUsersRecord.csv