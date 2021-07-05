#requires -version 2.0 

<#
.SYNOPSIS
	Create snapshot of Active Directory database
			
.NOTES
	Author		: Alexandre Augagneur (www.alexwinner.com)
	File Name	: New-ADSnapshot.ps1
.EXAMPLE
	.\New-ADSnapshot.ps1
	
.EXAMPLE
	.\New-ADSnapshot.ps1 -MaxNumber 15
	
.PARAMETER MaxNumber
	Set the number of snapshots to keep (by default the rotation is disabled)
#>

[cmdletbinding()]

param
(	
	[int] $MaxSnapshots = 0
)

if ( Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\services\NTDS\Parameters" )
{
	# Identifying the volume where is stored the AD database
	$RegKeyDsaDbFile = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\NTDS\Parameters").'DSA Database File'
	$NTDSFileLetter = Split-Path $RegKeyDsaDbFile -Qualifier

	$Volume = Get-WmiObject -Class Win32_Volume -Filter "DriveLetter = '$NTDSFileLetter'" -Property DeviceID

	# Starting rotation
	if ( $MaxSnapshots -ne 0 )
	{	
		$Shadows = Get-WmiObject -Class Win32_ShadowCopy | Where-Object { $_.VolumeName -eq $Volume.DeviceID } | Sort InstallDate
	
		if ( $Shadows.Count -ge $MaxSnapshots )
		{
			$i = 0
			$Count = $Shadows.Count
			
			while ( $Count -ge $MaxSnapshots )
			{
				$Shadows[$i].Delete()
				$i++
				$Count--
			}
		}
	}

	# Constructing the diskshadow script file
	$DShadowFile = $env:TEMP+"\shadowscript.dsh"

	$Content = "set context persistent`r`n"
	$Content += "begin backup`r`n"
	$Content += "writer verify {b2014c9e-8711-4c5c-a5a9-3cf384484757}`r`n"
	$Content += "set metadata $($env:TEMP)\shadowscript.cab`r`n"
	$Content += "add volume $($NTDSFileLetter) alias SNAPAD`r`n"
	$Content += "create`r`n"
	$Content += "end backup"
	$Content | out-file $DShadowFile -encoding ascii -Force

	# Creating the snapshot
	Invoke-Expression "diskshadow -s $DShadowFile" | Out-Null
}
else
{
	Write-Verbose "The current system is not a Domain Controller"
}
