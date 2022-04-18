<#
    .SYNOPSIS
    Searches for disabled AD Users

    .DESCRIPTION
    Searches for disabled AD Users and formats them into a table

    .EXAMPLE
    PS> ./FindLockedOutAccounts.ps1
#>

Search-ADAccount -LockedOut | Format-Table Name, ObjectClass -A