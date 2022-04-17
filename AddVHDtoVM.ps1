[CmdletBinding()]
param (
    [Parameter()]
    $vmname,
    [Parameter()]
    $path
)

Add-VMHardDiskDrive -VMName $vmname -Path $path
Write-Host("Added VHD from $path to the Virtual Machine $vmname")