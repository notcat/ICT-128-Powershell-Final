<#
    .SYNOPSIS
    Gets a cat fact

    .DESCRIPTION
    Gets a cat fact from https://catfact.ninja

    .EXAMPLE
    PS> ./GetCatFact.ps1
#>

$fact = Invoke-WebRequest -Uri "https://catfact.ninja/fact" -UseBasicParsing 

Write-Host("Your cat fact of the day is:")
$fact | ConvertFrom-Json | Select-Object -ExpandProperty fact 