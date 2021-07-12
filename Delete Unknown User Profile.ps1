$Computer = "DESKTOP-T20064S"
$Output = "C:\Temp\AccountUnknownProfiles\CleanUPProfiles.xls"
Get-CimInstance win32_userprofile | foreach {
Get-wmiobject win32_userprofile -Computername DESKTOP-T20064S | Select PSComputerName,LocalPath,SID,LastUseTime | Export-Csv -Path $output | format-list
$u = $_
try {
$objSID = New-Object System.Security.Principal.SecurityIdentifier($U.sid) -ErrorAction stop
$objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
"User={0}" -f $objUser.Value
"Path={0}" -f $u.LocalPath
"SID={0}" -f $u.SID
}
catch {
"!!!!!Account Unknown!!!!!"
"Path={0}" -f $u.LocalPath
"SID={0}" -f $u.SID
Remove-CimInstance -inputobject $u -verbose
$count++
}
}
$PC = [System.Net.DNS]::GetHostByName($Null) HostName
Write-Host "on" $PC $count "Account Unknown has been deleted"
