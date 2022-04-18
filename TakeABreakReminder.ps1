<#
    .SYNOPSIS
    Reminder to take a break in 15 minutes

    .DESCRIPTION
    Shows a reminder that tells you to take a break in 15 minutes.
    Requires ShowNotificationFunction.ps1

    .EXAMPLE
    PS> ./TakeABreakReminder.ps1
#>

Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-c Import-module .\ShowNotificationFunction.ps1 -Force; echo hi; Start-Sleep -Seconds 3600; Show-Notification 'Reminder' 'Take a small 15 minute break!'"