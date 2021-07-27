$ErrorActionPreference = 'SilentlyContinue'

#Instal Microsoft Desktop App Installer
    Write-Output "Checking winget..."
    Try{
	    # Check if winget is already installed
	    $er = (invoke-expression "winget -v") 2>&1
	    if ($lastexitcode) {throw $er}
	    Write-Output "winget is already installed."
    }
    Catch{
	    # winget is not installed. Install it from the Github release
	    Write-Output "winget is not found, installing it right now."
	
	    $download = "https://github.com/microsoft/winget-cli/releases/download/v1.0.11692/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
	    $output = $PSScriptRoot + "\winget-latest.appxbundle"
	    Write-Output "Dowloading latest release"
	    Invoke-RestMethod -Uri $download -OutFile $output
	
	    Write-Output "Installing the package"
	    Add-AppxPackage -Path $output
    }
