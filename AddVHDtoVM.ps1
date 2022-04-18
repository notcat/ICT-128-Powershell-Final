<#
    .SYNOPSIS
    Adds a VHD to a Hyper-V VM

    .DESCRIPTION
    Adds a new VHD to an exisitng Hyper-V VM

    .PARAMETER vmname
    Name of the virtual machine 

    .PARAMETER path
    Path to the new VHD that you want to add to the VM

    .EXAMPLE
    PS> ./AddVHDtoVM.ps1 -vmname DC01 -path "C:/VM/VHD/NewVHD.vhdx"
#>

[CmdletBinding()]
param (
    [Parameter()]
    $vmname,
    [Parameter()]
    $path
)

Add-VMHardDiskDrive -VMName $vmname -Path $path
Write-Host("Added VHD from $path to the Virtual Machine $vmname")