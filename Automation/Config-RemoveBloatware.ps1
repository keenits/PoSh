$ErrorActionPreference = 'SilentlyContinue'

Write-Output "Removing Most Provisioned Apps - Keep Basic Tools"
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -notlike "*windows*"} | Where-Object {$_.PackageName -notlike "*store*"} | Remove-AppxProvisionedPackage -Online

Write-output "Removing Most Apps - Keep Basic Tools"
Get-AppxPackage -AllUsers  | Where-Object {$_.PackageFullName -notlike "*windows*"} | Where-Object {$_.PackageFullName -notlike "*store*"} | Remove-AppxPackage
