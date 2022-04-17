<#
    .Synopsis 
        Get the DNS servers list of each IP enabled network connection and tests the connection to google.com

#>

Get-DnsClientServerAddress -AddressFamily IPv4
# $interface = Read-Host("What interface Index do you want to test?")

# I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell I hate powershell 

# $dns1 = Get-DnsClientServerAddress -AddressFamily IPv4 -InterfaceIndex $interface | Select-Object ServerAddresses
# $dns2 = Get-DnsClientServerAddress -AddressFamily IPv4 -InterfaceIndex $interface | Select-Object ServerAddresses

# ping $dns1
# ping $dns2


$resolveresult = Resolve-DnsName -Name google.com -ErrorAction Stop

echo $resolveresult | Format-Table