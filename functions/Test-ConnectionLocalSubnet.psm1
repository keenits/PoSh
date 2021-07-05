function Test-ConnectionLocalSubnet {
param ([Parameter(Mandatory=$True,Position=1)]
[System.Net.IPAddress]$IPAddress)
arp -d
$entry= Write-Host "Testing $IPAddress ..."
$line="_____________________________________________________________"
$ping=Test-Connection -ComputerName $IPAddress -Count 3 -Quiet
$arp=[boolean](arp -a | Select-String "$IPAddress")
If ($ping -and $arp)
{$line; Write-Host "ICMP: successful" -ForegroundColor Green`n; Write-Host "ARP : successful" -ForegroundColor Green`n; $line; Write-Host "Host ${IPAddress} is up" -ForegroundColor Green; Write-Host ""}
elseif ($ping -and !$arp)
{$line; Write-Host "ICMP: successful" -ForegroundColor Green`n; Write-Host "ARP : failure" -ForegroundColor Red`n; $line; Write-Host "Host ${IPAddress} is up, but possibly not on local subnet"; Write-Host ""}
elseif (!$ping -and $arp)
{$line; Write-Host "ICMP: failure" -ForegroundColor Red`n; Write-Host "ARP : successful" -ForegroundColor Green`n; $line; Write-Host "Possible Cause on ${IPAddress}: Windows Firewall is blocking traffic"; Write-Host ""}
else
{$line; Write-Host "ICMP: failure" -ForegroundColor Red`n; Write-Host "ARP : failure" -ForegroundColor Red`n; $line; Write-Host "Host ${IPAddress} is down" -ForegroundColor Red; Write-Host ""
}
}
