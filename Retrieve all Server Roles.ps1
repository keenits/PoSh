# .SYNOPSIS
# This script collects all installed Server Roles and Features
# from all domain-joined Windows Servers.
 
# .DESCRIPTION
# The result is displayed in the console and a report will be
# saved in $HOME\ServerRoles"Date".txt.
# The file will open automatically.
 
# .NOTES
# Run this script with administrative privileges
# on a domain-controller of your domain.
# Supported PowerShell versions: PowerShell 5.1, PowerShell 7
 
# .AUTHOR
# Patrick Gruenauer | Microsoft MVP PowerShell [2018-2020]
 
# .WEB
# https://sid-500.com
 
############################ CODE ###############################
 
### Retrieving all Servers by Name
 
$ErrorActionPreference = "SilentlyContinue"
 
$servers = (Get-ADComputer -Properties operatingsystem `
-Filter 'operatingsystem -like "*server*" -and enabled -eq "true"').Name
 
### Collection Point
 
$result = @()
 
### Ping all Member-Server and if ping is successful run
# Get-WindowsFeature
 
foreach ($item in $servers) {
 
$test = Test-Connection $item -Count 1
 
### Providing PowerShell 7 and 5.1 compatibility in terms of return code
 
If ($test.Status -eq 'Success' -or $test.StatusCode -eq '0')
{
 
$roles = Get-WindowsFeature -ComputerName $item |
Where-Object InstallState -EQ 'Installed'
 
### Write into the collection point
 
$result += New-Object -TypeName PSObject -Property ([ordered]@{
 
'Server' = $item
'Roles' = $roles.Name -join "`r`n"
### Escape Character CarriageReturn (`r) + NewLine (`n)
 
}
)
 
}
}
 
### Generating Outputs
 
# Collecting Point: Console Output
 
Write-Output $result | Format-Table -Wrap
 
# Text File Output
 
$date = Get-Date -Format MM.dd.yyyy
$result | Format-Table -Wrap |
Out-File "$HOME\ServerRoles$date.txt"
Write-Warning "Output file ServerRoles$date.txt generated in $HOME ... Opening file ..."
 
# Opening File
 
Start-Process $HOME\"ServerRoles$date.txt"
