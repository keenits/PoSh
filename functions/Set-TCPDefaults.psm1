# https://msdn.microsoft.com/en-us/library/cc296845(v=bts.10).aspx

param (
    [switch]$Fix = $false
)

function Set-RegistryProperty ($name, $value) {

    $changed = $false
    
    $existing = Get-ItemProperty -Path . -Name $name -ErrorAction SilentlyContinue
    
    if ( ( $existing -ne $null ) -and $Fix ) {
        
        $existingValue = $existing."$name"
        
        if ( $existingValue -ne $value ) {
         
            Write-Host "Removing $name because it has value $existingValue instead of $value..."
            Remove-ItemProperty -Path . -Name $name        
            $existing = $null
            Write-Host "Done!"
            $changed = $true
            
        }
        
    }
    
    if ( $existing -eq $null ) {

        Write-Host "Setting $name to $value..."
        New-ItemProperty -Path . -Name $name -PropertyType DWORD -Value $value | Out-Null
        Write-Host "Done!"
        $changed = $true

    }
    else {
    
        $existingValue = $existing."$name"
        Write-Host "$name already set to $existingValue."
        
    }
    
}

Push-Location Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters

$changed = $false

try {

    # Increase the upper range of short-lived ports that are dynamically allocated to client TCP/IP socket connections
    $changed = Set-RegistryProperty MaxUserPort 65534
    # Reduce the client TCP/IP socket connection timeout value from the default value of 240 seconds
    $changed = (Set-RegistryProperty TcpTimedWaitDelay 30) -or $changed
        
} finally {

    if ( $changed ) {
        Write-Warning "You must restart the machine for changes to take effect!"
    }
    
    Pop-Location

}
