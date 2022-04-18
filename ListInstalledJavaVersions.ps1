<#
    .SYNOPSIS
    Lists the installed java versions

    .DESCRIPTION
    Lists the installed java versions

    .EXAMPLE
    PS> ./ListInstalledJavaVersions.ps1
#>

$installedversions = Get-ChildItem -Path "C:\Program Files\Java" | Select-Object -Expand Name 

foreach ($version in $installedversions) {
    Write-Host("Java version `"$version`" installed")
}