<#
    .SYNOPSIS
    Downloads a video from youtube

    .DESCRIPTION
    Downloads a video from youtube given a url

    .PARAMETER url
    Specifies the video to download from youtube

    .EXAMPLE
    PS> ./DownloadYoutubeVideo.ps1 -url https://www.youtube.com/watch?v=TKfS5zVfGBc
#>  

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

