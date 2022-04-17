$installedversions = Get-ChildItem -Path "C:\Program Files\Java" | Select-Object -Expand Name 

foreach ($version in $installedversions) {
    Write-Host("Java version `"$version`" installed")
}