<# 
Author: Patrick Gruenauer | Microsoft PowerShell MVP [2018-2022]
Web: sid-500.com
This script is inteded for use in a test environment. It creates OUs, 
Groups and Users. 
#>
 
# If necessary, bypass the execution policy and suppress errors.
 
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force -Confirm:$false
$ErrorActionPreference = "SilentlyContinue"
 
# Define your OUs, Groups and Users here
 
$OUs = 'HR','Technicians','CEOs','Groups','Workstations'
$Groups = 'HR','Technicians','CEOs'
$usernames = @('Hans Womanizer','Tatjana Schlank','Birgit Langbein',
'Franz Bizeps','Bernd Bullseye','Michael Hightower','Patrick Cumbersome',
'Peter Travesty','Markus Haul','Tatjana Linux','Maria Azure','Susanne Amazon')
 
$root = $env:USERDNSDOMAIN.Split('.')[1]
$sub = $env:USERDNSDOMAIN.Split('.')[0]
 
# Create OUs
 
Foreach ($o in $OUs) {
 
New-ADOrganizationalUnit -Name $o -Verbose
 
}
 
# Create Groups
 
Foreach ($g in $Groups) {
 
New-ADGroup -Name $g `
-Path "OU=Groups,DC=$sub,DC=$root" `
-GroupScope Universal -GroupCategory Security -Verbose
 
}
 
# Create Users and place them into random OU. Add users to groups that match OU.
 
foreach ($u in $usernames) {
 
$split = $u.split(' ')
$randomou = Get-Random -InputObject 'HR','Technicians','CEOs'
 
$sam = ($split[0].Substring(0,1) + '.' + $split[1]).ToLower()
$upn = ($split[0].Substring(0,1) + '.' + $split[1] + '@' + $env:USERDNSDOMAIN).ToLower()
 
New-ADUser `
-Name $u `
-GivenName $split[0] `
-Surname $split[1] `
-DisplayName $u `
-Enabled $true `
-AccountPassword (ConvertTo-SecureString -AsPlainText '123user!' -Force) `
-SamAccountName $sam `
-UserPrincipalName $upn `
-Path "OU=$randomou,DC=$sub,DC=$root" `
-Verbose
 
}
 
# Add OU Users to Group
 
$ceos = "OU=CEOs,DC=$sub,DC=$root"
$hr = "OU=HR,DC=$sub,DC=$root"
$tech = "OU=Technicians,DC=$sub,DC=$root"
 
Get-ADUser -Filter * -SearchBase $ceos | 
ForEach-Object {Add-ADGroupMember -Identity CEOs -Members $_ -Verbose}
 
Get-ADUser -Filter * -SearchBase $hr | 
ForEach-Object {Add-ADGroupMember -Identity HR -Members $_ -Verbose}
 
Get-ADUser -Filter * -SearchBase $tech | 
ForEach-Object {Add-ADGroupMember -Identity Technicians -Members $_ -Verbose}
 
Start-Process dsa.msc
