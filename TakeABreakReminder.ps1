

Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-c Import-module .\ShowNotificationFunction.ps1 -Force; echo hi; Start-Sleep -Seconds 3600; Show-Notification 'Reminder' 'Take a small 15 minute break!'"