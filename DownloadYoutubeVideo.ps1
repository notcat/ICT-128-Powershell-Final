[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $url
)

if ($url -eq "") {
    $url = Read-Host("What is the youtube url to the video you want to download?")

    & youtube-dl.exe $url
}
else {
    & youtube-dl.exe $url
}

