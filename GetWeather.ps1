
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