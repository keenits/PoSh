$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'

#Declare LocalUser Object
$ObjLocalUser = $null

#User to search for
$usr1 = "@usr_1@"

#Validate password
if ( "@pwd_1@" -ne ""){
    $secpwd1 = ConvertTo-SecureString "@pwd_1@" -AsPlainText -Force
    }
    else{
        Write-Error "No password provided, exiting script"
        Exit
        }

Try {
    Write-Verbose "Searching for $($usr1) in the local Administrators group"
    $ObjLocalUser = Get-LocalGroupMember -Group Administrators -Member $($usr1)
	    Set-LocalUser -Name $($usr1) -Password $($secpwd1)
            Write-Verbose "User $($usr1) already has admin permissions... Successfully reset password"
            Exit
    }

Catch [Microsoft.PowerShell.Commands.PrincipalNotFoundException] {
    "User $($usr1) was not found in the local Administrators group... Searching for $($usr1) on the local system" | Write-Warning
    }

Catch {
    "An unspecifed error occured" | Write-Error
    Exit # Stop Powershell! 
    }

If (!$ObjLocalUser) {
    Try {
        $ObjLocalUser = Get-LocalUser $($usr1)
            Set-LocalUser -Name $($usr1) -Password $($secpwd1)
            Add-LocalGroupMember -Group Administrators -Member $($usr1)
                Write-Verbose "User $($usr1) was found... Successfully reset password and added $($usr1) account the local Administrators group"
        Exit
        }

	    Catch [Microsoft.PowerShell.Commands.UserNotFoundException] {
	        "User $($usr1) was not found... Creating and adding to the local Administrators group" | Write-Warning
        }

	    Catch {
	        "An unspecifed error occured" | Write-Error
	    Exit # Stop Powershell! 
        }

	If (!$ObjLocalUser) {
	    New-LocalUser -AccountNeverExpires:$true -Password $($secpwd1) -Name $($usr1) -PasswordNeverExpires | Add-LocalGroupMember -Group Administrators
            Write-Verbose "Successfully created $($usr1) and added account to the local Administrators group"
    Exit
    }
}
