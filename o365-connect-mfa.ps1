## CIAOPS
## Script provided as is. Use at own risk. No guarantees or warranty provided.

## Description
## Script designed to log into the Office 365 admin portal when multi factor security is enabled

## Source - https://github.com/directorcia/Office365/blob/master/o365-connect-mfa.ps1

## Prerequisites = 1
## 1. Ensure msonline MFA module installed or updated

## Variables
$systemmessagecolor = "cyan"
$processmessagecolor = "green"

## If you have running scripts that don't have a certificate, run this command once to disable that level of security
##  set-executionpolicy -executionpolicy bypass -scope currentuser -force

Clear-Host

write-host -foregroundcolor $systemmessagecolor "Script started`n"

## ensure that Exchange Online MFA modules has been run
## Download and install MFA cmdlets from - https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/mfa-connect-to-exchange-online-powershell?view=exchange-ps

Import-Module $((Get-ChildItem -Path $($env:LOCALAPPDATA+"\Apps\2.0\") `
-Filter Microsoft.Exchange.Management.ExoPowershellModule.dll -Recurse ).FullName|?{$_ -notmatch "_none_"} `
|select -First 1)
write-host -foregroundcolor $processmessagecolor "Exchange Online MFA module loaded"

$EXOSession = New-ExoPSSession
Import-PSSession $EXOSession
write-host -foregroundcolor $processmessagecolor "Connected to Exchange Online MFA`n"
write-host -foregroundcolor $systemmessagecolor "Script Completed`n"