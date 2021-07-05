# PoSh

OPTION 1:
Set-ExecutionPolicy remotesigned -force
New-Item $profile -Force | Out-Null
Add-Content $profile -Value {function Test-Gateway {Test-Connection -ComputerName (Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Select-Object -ExpandProperty NextHop) -Quiet}}


OPTION 2:
pen PowerShell ISE. Copy the function to your ISE session. Create a folder in C:\Program Files\Windows PowerShell\Modules and save the code as psm1 file. Make sure that your file name and sub folder name match (e.g. Get-SystemInfo)
