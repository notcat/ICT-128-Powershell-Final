$domain = Read-Host("What is the domain name of the domain you want to join? (Example: int.company.com")

Add-Computer -DomainName $domain -Restart