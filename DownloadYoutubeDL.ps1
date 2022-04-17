# https://yt-dl.org/latest/youtube-dl.exe

# $env:Path -split ';'
# https://www.techtarget.com/searchitoperations/answer/Manage-the-Windows-PATH-environment-variable-with-PowerShell
function Add-PathVariable {
    param (
        [string]$addPath
    )
    if (Test-Path $addPath) {
        $regexAddPath = [regex]::Escape($addPath)
        $arrPath = $env:Path -split ';' | Where-Object { $_ -notMatch 
            "^$regexAddPath\\?" }
        $env:Path = ($arrPath + $addPath) -join ';'
    }
    else {
        Throw "'$addPath' is not a valid path."
    }
}

# Check if folder already exists
if ((test-path "$env:APPDATA\youtube-dl") -eq $false) {
    New-Item -Path "$env:APPDATA" -Name "youtube-dl" -Force -ItemType "directory"
    Write-Output "Created folder $env:APPDATA/youtube-dl"
}

# Check if youtube-dl.exe is already downloaded
if ((test-path "$env:APPDATA\youtube-dl\youtube-dl.exe") -eq $false) {
    Write-Output "Downloading youtube-dl.exe"
    Invoke-WebRequest -Uri "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" -OutFile "$env:APPDATA\youtube-dl\youtube-dl.exe"
    Write-Output "Finished downloading!"
}

if (("$env:Path").Contains("$env:APPDATA\youtube-dl") -eq $false) {
    Write-Output "Adding youtube-dl.exe to the path enviornment variable"

    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    
    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -ne $true) {
        Write-Host("Because you do not have administrator, this setup cannot continue. Please rerun this script as administrator.")

        exit
    }

    [Environment]::SetEnvironmentVariable(
        "Path",
        [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";$env:APPDATA\youtube-dl",
        [EnvironmentVariableTarget]::Machine)
}

Write-Host("youtube-dl.exe successfuly installed!")

& "$env:APPDATA\youtube-dl\youtube-dl.exe"

#[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";$env:APPDATA\youtube-dl", [EnvironmentVariableTarget]::Machine)
#$Env:PATH += ";$env:APPDATA\youtube-dl\youtube-dl.exe"
#Add-PathVariable("$env:APPDATA\youtube-dl\youtube-dl.exe")