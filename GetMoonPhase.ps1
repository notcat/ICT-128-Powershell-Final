<#
    .SYNOPSIS
    Gets the current moon phase

    .DESCRIPTION
    Gets the current moon phase with an optional date. Date format is "2021-Mar-15"

    .PARAMETER date
    Date format is "2021-Mar-15"

    .EXAMPLE
    PS> ./GetMoonPhase.ps1 2021-Mar-15
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $date
)

#Try ./GetMoonPhase.ps1 2021-Mar-15

if ($date -ne "") {
    Invoke-WebRequest wttr.in/Moon@$date | Select-Object -Expand Content
}
else {
    Invoke-WebRequest wttr.in/Moon | Select-Object -Expand Content
}