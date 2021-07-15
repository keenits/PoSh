####################################################################################
#
#  Ian Waters
#
#  www.slashadmin.co.uk
#
#  Prevents Windows 10 prompting to setup a pin after being added to Azure AD
#
#  Designed for use with Office 365 Business Premium subscriptions
#
####################################################################################


#Disable pin requirement
$path = "HKLM:\SOFTWARE\Policies\Microsoft"
$key = "PassportForWork"
$name = "Enabled"
$value = "0"

New-Item -Path $path -Name $key �Force

New-ItemProperty -Path $path\$key -Name $name -Value $value -PropertyType DWORD -Force

#Delete existing pins
$passportFolder = "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc"

if(Test-Path -Path $passportFolder)
{
    Takeown /f $passportFolder /r /d "Y"
    ICACLS $passportFolder /reset /T /C /L /Q

    Remove-Item �path $passportFolder �recurse -force
}
