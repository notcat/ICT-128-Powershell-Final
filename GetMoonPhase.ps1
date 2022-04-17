
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