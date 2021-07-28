$ConnectionName = "@ConnectionName@"
$ServerAddress = "@ServerAddress@"
$PresharedKey = "@PresharedKey@"
$Destination = "@IPScope@"
$DNSSuffix = "@DNSSuffix@"
$TunnelType = 'L2tp'
$AuthMethod = @('PAP')
$EncryptionLevel = 'Required'
$RememberCredential = $false
$SplitTunnel = $true

Write-Output "Removing up previous profiles..."
  Get-VpnConnection | Where-Object {$_.name -eq $ConnectionName} | Remove-VpnConnection -force
  Get-VpnConnection -AllUserConnection | Where-Object {$_.name -eq $ConnectionName} | Remove-VpnConnection -force

Write-Output "Creating VPN profile..."
  Add-VpnConnection -Name $ConnectionName -ServerAddress $ServerAddress -TunnelType $TunnelType -EncryptionLevel Optional -AuthenticationMethod $AuthMethod -AllUserConnection -SplitTunneling -L2tpPsk $PresharedKey -Force -RememberCredential $RememberCredential -DnsSuffix $DNSSuffix -IdleDisconnectSeconds $IdleDisconnect
  Start-Sleep -Milliseconds 100

Write-Output "Adding the IP route..."
  Add-VpnConnectionRoute -ConnectionName $ConnectionName -DestinationPrefix $Destination -RouteMetric 1 -AllUserConnection



#Cisco Needs This Registry Entry To Work Properly
#$RegistryPath = "HKLM:\System\CurrentControlSet\Services\PolicyAgent"
#$RegName = 'AssumeUDPEncapsulationContextOnSendRule'
#$Regvalue = 2
#New-ItemProperty -Path $RegistryPath -Name $RegName -Value $Regvalue -PropertyType DWORD -Force
#Restart computer to load the Cisco Regkey you just updated.
#Read-Host -Prompt "Press Enter To Restart Computer"
#Restart-Computer -Force

