Get-NetAdapter

$int = Read-Host("What Interface Index of the adaptor do you want to change?")

$dns1 = Read-Host("First DNS Server (xxx.xxx.xxx.xxx)")
$dns2 = Read-Host("Second DNS Server (xxx.xxx.xxx.xxx)")

Set-DnsClientServerAddress -InterfaceIndex $int -ServerAddresses "$dns1 , $dns2"

Write-Output "The result will only show in a ipconfig /all"

Write-Output "DONE!"