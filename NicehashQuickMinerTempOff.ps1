<#
    .SYNOPSIS
    Temporarily turns on Nicehash Quickminer Excavator

    .DESCRIPTION
    Temporarily turns on Nicehash Quickminer Excavator through sending a web request

    .EXAMPLE
    PS> ./NicehashQuickMinerTempOff.ps1
#>

Import-module .\ShowNotificationFunction.ps1 -Force

# Send a request to the local QuickMiner service to stop mining
Invoke-WebRequest -Uri "http://localhost:18000/api?command={`"id`":1,`"method`":`"miner.stop`",`"params`":[]}" -Headers @{"Authorization" = "8903439CE08904DE9EDFD4FA" }

Show-Notification "Nicehash Quick Miner" "Miner stopped for 1 hour!"

Start-Sleep -Seconds 3600

Invoke-WebRequest -Uri "http://localhost:18000/api?command={`"id`":1,`"method`":`"quit`",`"params`":[]}" -Headers @{"Authorization" = "8903439CE08904DE9EDFD4FA" }

# I originally had this done properly with this spawning a new powershell process, hidden, and in the background. 
# However, powershell is a PITA and a disgraceful language and I was unable to figure out how to escape quotes inside quotes inside quotes, three layers deep. 
# I swear I could do this in any other language in 2 seconds but here, no. no fun allowed with powershell. Only pain. Pain and suffering.
