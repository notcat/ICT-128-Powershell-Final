<#
    .SYNOPSIS
    Get OS Version info

    .DESCRIPTION
    Get OS Version info
    
    .EXAMPLE
    PS> ./GetOSVersionInformation.ps1
#>

Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property BuildNumber, BuildType, OSType, ServicePackMajorVersion, ServicePackMinorVersion