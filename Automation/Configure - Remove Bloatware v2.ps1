$ErrorActionPreference = 'SilentlyContinue'

Write-Output "Removing Most Provisioned Apps - Keep Basic Tools"
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -notlike "*windows*"} | Where-Object {$_.PackageName -notlike "*store*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*windowscommunicationsapps*"} | Where-Object {$_.PackageName -like "*feedbackhub*"} | Remove-AppxProvisionedPackage -Online

Write-output "Removing Most Apps - Keep Basic Tools"
Get-AppxPackage -AllUsers  | Where-Object {$_.PackageFullName -notlike "*windows*"} | Where-Object {$_.PackageFullName -notlike "*store*"} | Remove-AppxPackage
Get-AppxPackage -AllUsers  | Where-Object {$_.PackageFullName -like "*windowscommunicationsapps*"} | Where-Object {$_.PackageFullName -like "*feedbackhub*"} | Remove-AppxPackage
