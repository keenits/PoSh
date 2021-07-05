do {
Write-Host '\\\\\\\\\\\\\\ This script deletes all print jobs. \\\\\\\\\\\\\\'
''
$sure=Read-Host "Are you sure you want to delete all Print Jobs on $env:computername (Y/N)"
''
If ($sure -eq 'Y')
 
{
'================================================================='
 
Stop-Service spooler
Write-Host '1. Stopping Spooler Service ...' -ForegroundColor Green
Remove-Item -Path $env:windir\system32\spool\PRINTERS\*.*
Write-Host "2. Clearing content in $env:windir\system32\spool\PRINTERS" -ForegroundColor Green
Write-Host '3. Starting Spooler Service ...' -ForegroundColor Green
$start=Start-Service Spooler -ErrorAction Ignore
If ((Get-Service spooler).status -eq 'Stopped')
{Write-Host '!!! Error. Spooler could not be started or stopped. Check Service. !!!' -ForegroundColor Red}
 
'================================================================='
''
 
PAUSE
}
}
while ($sure -ne 'N')
