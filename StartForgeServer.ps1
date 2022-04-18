<#
    .SYNOPSIS
    CLI to start a Minecraft Forge server

    .DESCRIPTION
    CLI to start a Minecraft Forge server

    .EXAMPLE
    PS> ./StartForgeServer.ps1
#>

Write-Host("Select what version of Java you would like to use")
$installedversions = Get-ChildItem -Path "C:\Program Files\Java" | Select-Object -Expand Name 

foreach ($version in $installedversions) {
    $i = $installedversions.IndexOf($version) + 1 #arrays start at 0
    Write-Host("($i) Java version `"$version`" installed")
}

$selectversion = Read-Host("Choose a number") 

if ($selectversion -lt 1 -or $selectversion -gt $installedversions.Length) {
    # -le doesnt work? what??? why is powershell like this?? I just want less than or equal to...
    Write-Output "Invalid Input!, choose a number in the range from above"
    exit
}

$selectedjavaversion = $installedversions[$selectversion - 1]
Write-Output("$selectedjavaversion selected.")

$forgeversions = @()
$selectedforgeversion = ""
Get-ChildItem | ForEach-Object ($folder) {
    if ($_.Name.StartsWith("forge-") -and $_.Name.Contains(".jar")) {
        $forgeversions += $_.Name
    }
}

if ($forgeversions.Length -gt 1) {
    Write-Host("There are more than one versions of forge in the folder, choose from the list")

    foreach ($version in $forgeversions) {
        $i = $forgeversions.IndexOf($version) + 1 #arrays start at 0
        Write-Host("($i) forge version `"$version`"")
    }

    $selectversion = Read-Host("Choose a number") 

    if ($selectversion -lt 1 -or $selectversion -gt $forgeversions.Length) {
        # -le doesnt work? what??? why is powershell like this?? I just want less than or equal to...
        Write-Output "Invalid Input!, choose a number in the range from above"
        exit
    }

    $selectedforgeversion = $forgeversions[$selectversion - 1]
}
else {
    $selectedforgeversion = $forgeversions[0]
}

Write-Output("Starting server...")
Write-Output("$selectedjavaversion selected.")
& "C:\Program Files\Java\$selectedjavaversion\bin\java" -Xmx4096M -jar $selectedforgeversion nogui
Write-Output("Server exited/crashed!")
Pause