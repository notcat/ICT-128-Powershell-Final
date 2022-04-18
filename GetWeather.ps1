<#
    .SYNOPSIS
    Gets the weather

    .DESCRIPTION
    Gets the weather with an optional airport parameter. Uses the 3 letter airport codes.

    .PARAMETER username
    Uses the 3 letter airport codes.

    .EXAMPLE
    PS> ./DisableADUser.ps1 -airport JFK
#>


[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $airport
)

if ($airport -ne "") {
    Invoke-WebRequest wttr.in/$airport | Select-Object -Expand Content
}
else {
    Invoke-WebRequest wttr.in | Select-Object -Expand Content
}