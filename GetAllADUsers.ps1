Import-Module ActiveDirectory

Get-ADUsers -Filter * -SearchBase "OU=Users,DC=example,DC=com" | Select-Object sAMAccountName, givenName | export-csv -path C:\Scripts\ADUsersRecord.csv