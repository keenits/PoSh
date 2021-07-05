function Test-Gateway {Test-Connection -ComputerName (Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Select-Object -ExpandProperty NextHop) -Quiet}
