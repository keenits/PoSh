# PoSh

&& this will run the second command only if the first one succeeds.
|| this will run the second command only if the first one fails.

x && y || z chained together

Example:
PS Z:\Powershell-Scripts> ipconfig && Write-Error "abc" || ipconfi
