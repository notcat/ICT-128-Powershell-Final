<#
    .SYNOPSIS
    Gets inactive users from active directory

    .DESCRIPTION
    Gets inactive users from active directory and outputs them to a CSV

    .EXAMPLE
    PS> ./GetInactiveUsersActiveDirectory.ps1
#>

$presentdate = Get-Date

$output = Get-ADUser -Filter * -Properties lastlogondate | Where-Object { $_.lastlogondate -lt $presentdate.adddays(-90) } | Select-Object name

# csv export
$output | Export-Csv C:\inactiveusers.csv -NoTypeInformation

Write-Host "The following users are inactive : "
$output