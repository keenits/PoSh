###############################################################################
#
# Script to enhance your Privacy on Windows 10
# New-ItemProperty is used to set registry values, therefore the "if exist"
# operation is not requiered :-)
# 
# created 16.12.2015 Michael Albert info@michlstechblog.info
#
# changes:
# 1.0.1               Init release
# 1.0.2 17.08.2016 Michael Lot of adjustment to Windows 10 1607, more comments/documentation
#
# Version: 1.0.2
# License: No license. Feel free to modify
###############################################################################
# function for Keys located in Userhive
function SetValuesRelativeToKey([string] $sRootKey)
{
	cd $sRootKey
	# Policy

	# Privacy
	# Devicelist => HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess
	# App List => HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Mappings
	# Resolve
	# function GetDeviceName([string]$GUID){[string]::Join(",",(get-Childitem -Recurse HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\CapabilityMappings\*|?{$_.PSChildName -eq $GUID}|%{(Get-item $_.PSParentPath).PSChildname}))}
	# Sms
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{21157C1F-2651-4CC1-90CA-1F28B02263F6}" -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# ID_CAP_MICROPHONE,Microphone
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# Contacts,ContactsSystem,ID_CAP_CONTACTS
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# AccessoryManager,Chat,ChatSystem,ID_CAP_SMS,ID_CAP_SMS_COMPANION,SmsSend
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# Activity
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9D9E0118-1807-4F2E-96E4-2CE57142E196}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# Radios
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# Activity
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{B19F89AF-E3EB-444B-8DEA-202575A71599}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# ID_CAP_LOCATION,Location
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# UserAccountInformation
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# AccessoryManager,Appointments,AppointmentsSystem,ID_CAP_APPOINTMENTS,ID_CAP_SMS_COMPANION
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# ID_CAP_CAMERA,ID_CAP_ISV_CAMERA,Webcam
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# LocationHistory
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E6AD100E-5F4E-44CD-BE0F-2265D88D14F5}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# Sensors.Custom
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E83AF229-8640-4D18-A213-E22675EBB2C3}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# PhoneCallHistory,PhoneCallHistoryPublic,PhoneCallHistorySystem
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# Email,EmailSystem
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# PhoneCall
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{235B668D-B2AC-4864-B49C-ED1084F6C9D3}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	# UserNotificationListener
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled"  -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue|out-null

	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaEnabled" -Value 0 -Type DWORD -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0 -Type DWORD -Force -ErrorAction SilentlyContinue |out-null
	
	# Disbale Windows Feedback
	New-Item         "SOFTWARE\Microsoft\Siuf\Rules" -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty "SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0 -Type DWORD -Force -ErrorAction SilentlyContinue |out-null
	Remove-ItemProperty "SOFTWARE\Microsoft\Siuf\Rules" -Name 'PeriodInNanoSeconds' -Force -ErrorAction SilentlyContinue |out-null
	
	# Disable Cortona 
	New-Item         "SOFTWARE\Microsoft\Personalization\Settings" -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty "SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Value 0 -Type DWORD  -Force -ErrorAction SilentlyContinue |out-null
	New-Item         "SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language"  -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" -Name "Enabled" -Value 0 -Type DWORD  -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty "SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Value 1 -Type DWORD  -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty "SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value 1 -Type DWORD -Force -ErrorAction SilentlyContinue |out-null
	New-Item         "SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Force -ErrorAction SilentlyContinue | out-null
	New-ItemProperty "SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Value 0 -Type DWORD  -Force -ErrorAction SilentlyContinue |out-null

	# Disable access to Speechlist
	New-ItemProperty    "Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Value 1  -Force -ErrorAction SilentlyContinue |out-null
	Remove-ItemProperty "SOFTWARE\Microsoft\Internet Explorer\International" -Name "AcceptLanguage"  -Force -ErrorAction SilentlyContinue |out-null

	# Disable Feedback on write
	New-Item         "SOFTWARE\Microsoft\Input\TIPC" -Force -ErrorAction SilentlyContinue |out-null 
	New-ItemProperty "SOFTWARE\Microsoft\Input\TIPC" -Name "Enable" -Value 0 -Force -ErrorAction SilentlyContinue |out-null
	
	# Disable all Apps "allow installed Apps to run in Background"
	if(Test-Path "SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications")
	{
		get-childitem    "SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"| %{New-ItemProperty $_.PSPath -Name "Disabled" -Value 1 -Type DWORD  -Force -ErrorAction SilentlyContinue}  
	}
	
	# Not allow to get Ad ID
	New-Item         "SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force -ErrorAction SilentlyContinue | out-null
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0 -Force -ErrorAction SilentlyContinue |out-null
	New-Item         "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force -ErrorAction SilentlyContinue | out-null
	New-ItemProperty "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0 -Force -ErrorAction SilentlyContinue |out-null	

	# Disable Smartscreenfilter
	New-ItemProperty "SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" -Name "EnableWebContentEvaluation" -Value 0  -Force -ErrorAction SilentlyContinue |out-null
	
	
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry  -Type DWORD -Value 0  -Force -ErrorAction SilentlyContinue |out-null
    New-ItemProperty  "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry  -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue |out-null
	
	# Explorer Settings
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name LaunchTo -Type DWORD  -Value  1 -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Type DWORD  -Value  0 -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Type DWORD  -Value  1 -Force -ErrorAction SilentlyContinue |out-null
	
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name ToastEnabled -Type DWORD  -Value 0 -Force -ErrorAction SilentlyContinue |out-null
	# Disable P2P Update downloads outside of local network
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" -Name SystemSettingsDownloadMode -Type DWORD  -Value 0 -Force -ErrorAction SilentlyContinue |out-null
	# User Desktop Settings 
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name SearchboxTaskbarMode  -Type DWORD  -Value 1 -Force -ErrorAction SilentlyContinue |out-null
	New-ItemProperty  "Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" -Name NoTileApplicationNotification   -Type DWORD  -Value 1 -Force -ErrorAction SilentlyContinue |out-null
	# Disable Auto Systray => Show all icons
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name EnableAutoTray   -Type DWORD  -Value 0 -Force -ErrorAction SilentlyContinue |out-null
	# Search box small icon
	New-ItemProperty  "SOFTWARE\Microsoft\Windows\CurrentVersion\Search"  -Name SearchboxTaskbarMode   -Type DWORD  -Value 1 -Force -ErrorAction SilentlyContinue |out-null
	# Disable Background Applications by Default
	Get-ChildItem SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications|%{
		New-ItemProperty $_.PSPath -Name Disabled -Type DWORD  -Value 1 -Force -ErrorAction SilentlyContinue |out-null
		New-ItemProperty $_.PSPath -Name DisabledByUser -Type DWORD  -Value 1 -Force -ErrorAction SilentlyContinue |out-null
	}
}
###############################################################################
$error.clear()
# Check for Administrator permissions
$oIdent= [Security.Principal.WindowsIdentity]::GetCurrent()
$oPrincipal = New-Object Security.Principal.WindowsPrincipal($oIdent)
if(!$oPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator ))
{
	write-warning "Please start script with Administrator permissions."
	exit 1
}

# For all New Users (Default User Profile)
$sMountPointDefaultUser="HKLM\_TMP_SCRIPT"
& reg load $sMountPointDefaultUser "c:\Users\Default\NTUSER.DAT"
if(!$?)
{
	write-warning "Error occured while mounting the default user profile"
	exit 2
}
SetValuesRelativeToKey($sMountPointDefaultUser.Replace("HKLM","HKLM:"))
# For the current user
SetValuesRelativeToKey("HKCU:\")


# HKLM
New-Item          "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Force -ErrorAction SilentlyContinue|out-null
#  => Computer Configuration/Administrative Templates/Windows Components/Data Collection and Preview Builds/Toggle usercontrol over Insider builds
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Name "AllowBuildPreview" -Value 0 -Type DWORD  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Data Collection and Preview Builds/
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Name "EnableConfigFlighting" -Value 1 -Type DWORD  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Data Collection and Preview Builds/Disable pre-release features or settings
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Name "EnableExperimentation" -Value 0 -Type DWORD  -Force -ErrorAction SilentlyContinue|out-null
New-Item          "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Force -ErrorAction SilentlyContinue|out-null
# Administrative Templates/Windows Components/Data Collection and Preview Builds/Allow Telemetry
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWORD  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Data Collection and Preview Builds/Configure the Commercial ID
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "CommercialIdPolicy" -Value 0 -Type DWORD  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Windows Customer Experience Improvement Program/Tag Windows Customer Experience Improvement data with Study Identifier
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" -Name "CEIPEnable" -Type DWORD -Value 0  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Windows Customer Experience Improvement Program/Allow Corporate redirection of Customer Experience Improvement uploads
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" -Name "CorporateSQM" -Type DWORD -Value 0  -Force -ErrorAction SilentlyContinue|out-null
# New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\MRT" -Name "DontOfferThroughWUAU" -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Application Compatibility/Turn off Steps Recorder
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableUAR" -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Application Compatibility/Turn off Inventory Collector
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Application Compatibility/Turn off Application Telemetry
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "AITEnable" -Type DWORD -Value 0  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Windows Media Digital Rights Management/Prevent Windows Media DRM Internet Access
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\WMDRM" -Name "DisableOnline" -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/System/Internet Communication Management/Restrict Internet communication
New-ItemProperty  "HKLM:\Software\Policies\Microsoft\InternetManagement" -Name "RestrictCommunication"  -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# Administrative Templates/System/Internet Communication Management/Internet Communication settings/Turn off handwriting personalization data sharing
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name "PreventHandwritingDataSharing"  -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Control Panel/Personalization/Prevent enabling lock screen camera
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreenCamera" -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Search/Allow Cortana
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Biometrics/Allow the use of biometrics
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics" -Name "Enabled" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
# User Configuration/Administrative Templates/Windows Components/Location and Sensors/Turn off location	
New-ItemProperty  "SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# User Configuration/Administrative Templates/Windows Components/Location and Sensors/Turn off sensors
New-ItemProperty  "SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableSensors" -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# User Configuration/Administrative Templates/Windows Components/Location and Sensors/Turn off location scripting
New-ItemProperty  "SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocationScripting" -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/OneDrive/Prevent the usage of OneDrive for file storage
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/OneDrive/Save documents to OneDrive by default
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableLibrariesDefaultSaveToOneDrive" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/OneDrive/Prevent the usage of OneDrive for file storage on Windows 8.1
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSync" -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Prevent device metadata retrieval from the Internet
New-ItemProperty  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Do not send a Windows error report when a generic driver is installed on a device
New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" -Name "DisableSendGenericDriverNotFoundToWER"  -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Prevent Windows from sending an error report when a device driver requests additional software during installation
New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" -Name "DisableSendRequestAdditionalSoftwareToWER"  -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/System/Device Installation/Allow remote access to the Plug and Play interface
New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" -Name "AllowRemoteRPC"  -Type DWORD -Value 1  -Force -ErrorAction SilentlyContinue|out-null
#  Computer Configuration/Administrative Templates/Specify search order for device driver source locations
#New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\DriverSearching" -Name "SearchOrderConfig"  -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
#  Computer Configuration/Administrative Templates/Specify search order for device driver source locations
#New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate"  -Type DWORD -Value 1 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/File Explorer/Configure Windows SmartScreen
New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Type DWORD  -Value 0 -Force -ErrorAction SilentlyContinue|out-null
# Computer Configuration/Administrative Templates/Windows Components/Windows Update/Defer Windows Updates/Select when Feature Updates are received
New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdates" -Type DWORD  -Value 1 -Force -ErrorAction SilentlyContinue |out-null
# Computer Configuration/Administrative Templates/Windows Components/Windows Update/Defer Windows Updates/Select when Quality Updates are received
New-ItemProperty  "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdates" -Type DWORD  -Value 1 -Force -ErrorAction SilentlyContinue |out-null

New-ItemProperty  "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" -Name "Start" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
New-ItemProperty  "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" -Name "Start" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
New-ItemProperty  "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name "WiFiSenseCredShared" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
New-ItemProperty  "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name "WiFiSenseOpen" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
New-ItemProperty  "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet" -Name "SpyNetReporting"  -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
New-ItemProperty  "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
# SmartGlass => Let apps on my device open apps and continue experiences...
New-ItemProperty  "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" -Name UserAuthPolicy -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null
# SmartGlass => Let apps on my device use bluetooth to open apps....
New-ItemProperty  "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" -Name BluetoothPolicy -Type DWORD -Value 0 -Force -ErrorAction SilentlyContinue|out-null


# Disable P2P Update downloads outside of local network
New-ItemProperty  "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name DODownloadMode -Type DWORD  -Value 0 -Force -ErrorAction SilentlyContinue |out-null
New-ItemProperty  "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL" -Name SendTrustedIssuerList -Type DWORD  -Value 0 -Force -ErrorAction SilentlyContinue |out-null

# Tiles C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories
# HLCR
# Remove OneDrive from Explorer
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
Remove-Item    "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Force -Confirm:$false -ErrorAction SilentlyContinue|out-null
Remove-Item    "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Force -Confirm:$false  -ErrorAction SilentlyContinue|out-null

# Disable Services
# Connected User Experiences and Telemetry
Set-Service -Name diagtrack  -StartupType disabled
# Set-Service -Name dmwappushservice -StartupType disabled
# Retail Demo Service
Set-Service -Name RetailDemo -StartupType disabled
# BranchCache
Set-Service -Name PeerDistSvc -StartupType Disabled
# Problem Reports and Solutions Control Panel Support
Set-Service -Name wercplsupport -StartupType Disabled
# Telephony
Set-Service -Name TapiSrv -StartupType Disabled
# Windows Biometric Service
Set-Service -Name WbioSrvc -StartupType Disabled
# Windows Connect Now - Config Registrar
Set-Service -Name wcncsvc -StartupType Disabled
# Windows Remote Management (WS-Management)
Set-Service -Name winrm -StartupType Disabled
# Xbox Live Auth Manager
Set-Service -Name XblAuthManager -StartupType Disabled
# Xbox Live Game Save
Set-Service -Name XblGameSave -StartupType Disabled
# Xbox Live Networking Service
Set-Service -Name XboxNetApiSvc -StartupType Disabled
# exit 1

# Disable Schedule Tasks
$aDisableScheduleTasks=@("Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask",
# The Kernel CEIP (Customer Experience Improvement Program) task collects additional information about the system and sends this data to Microsoft.
# The USB CEIP (Customer Experience Improvement Program) task collects Universal Serial Bus related statistics and information about your machine and sends it to the Windows Device Connectivity engineering group at Microsoft.
"Microsoft\Windows\Customer Experience Improvement Program\UsbCeip",
"Microsoft\Windows\Customer Experience Improvement Program\Uploader",
"Microsoft\Windows\Customer Experience Improvement Program\BthSQM",
# If the user has consented to participate in the Windows Customer Experience Improvement Program, this job collects and sends usage data to Microsoft.
"Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
"Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem",
# Initializes Family Safety monitoring and enforcement.
"Microsoft\Windows\Shell\FamilySafetyMonitor",
# Synchronizes the latest settings with the Microsoft family features service.
"Microsoft\Windows\Shell\FamilySafetyMonitorToastTask",
# Synchronizes the latest settings with the Microsoft family features service.
"Microsoft\Windows\Shell\FamilySafetyRefreshTask",
# Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program.
"Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser",
"Microsoft\Windows\Application Experience\AitAgent",
# Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program
"Microsoft\Windows\Application Experience\ProgramDataUpdater",
"Microsoft\Windows\Application Experience\Uploader",
# This task collects and uploads autochk SQM data if opted-in to the Microsoft Customer Experience Improvement Program.
"Microsoft\Windows\Autochk\Proxy",
# The Windows Disk Diagnostic reports general disk and system information to Microsoft for users participating in the Customer Experience Program.
"Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector",
# "Microsoft\Windows\Maintenance\WinSAT",
"Microsoft\Office\OfficeTelemetryAgentFallBack2016",
"Microsoft\Office\OfficeTelemetryAgentLogOn2016",
"Microsoft\Office\Office ClickToRun Service Monitor",
"Microsoft\Office\OfficeTelemetry\AgentFallBack2016",
"Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn2016",
"Microsoft\Windows\Media Center\ActivateWindowsSearch",
"Microsoft\Windows\Media Center\ConfigureInternetTimeService",
"Microsoft\Windows\Media Center\DispatchRecoveryTasks",
"Microsoft\Windows\Media Center\ehDRMInit",
"Microsoft\Windows\Media Center\InstallPlayReady",
"Microsoft\Windows\Media Center\mcupdate",
"Microsoft\Windows\Media Center\MediaCenterRecoveryTask",
"Microsoft\Windows\Media Center\ObjectStoreRecoveryTask",
"Microsoft\Windows\Media Center\OCURActivate",
"Microsoft\Windows\Media Center\OCURDiscovery",
"Microsoft\Windows\Media Center\PBDADiscovery",
"Microsoft\Windows\Media Center\PBDADiscoveryW1",
"Microsoft\Windows\Media Center\PBDADiscoveryW2",
"Microsoft\Windows\Media Center\PvrRecoveryTask",
"Microsoft\Windows\Media Center\PvrScheduleTask",
"Microsoft\Windows\Media Center\RegisterSearch",
"Microsoft\Windows\Media Center\ReindexSearchRoot",
"Microsoft\Windows\Media Center\SqlLiteRecoveryTask",
"Microsoft\Windows\Media Center\UpdateRecordPath")
$aDisableScheduleTasks|%{Disable-ScheduledTask $_  -ErrorAction SilentlyContinue}

# Remove Software
# One Drive
#
# Kill all Processes
(get-process OneDrive -ErrorAction SilentlyContinue )|%{
		$_.Kill()|out-null
}


if(Test-Path ($ENV:SYSTEMROOT+"\SysWOW64\OneDriveSetup.exe"))
{
	write-host "Uninstalling Onedrive..."
	 & ($ENV:SYSTEMROOT+"\SysWOW64\OneDriveSetup.exe") /uninstall
}
if(Test-Path ($ENV:SYSTEMROOT+"\System32\OneDriveSetup.exe"))
{
	write-host "Uninstalling Onedrive..."
	& ($ENV:SYSTEMROOT+"\System32\OneDriveSetup.exe") /uninstall
}
$aRemoveBuiltinApps=@(
"Microsoft.XboxGameCallableUI",
"Microsoft.3DBuilder",
"Microsoft.SkypeApp",
"Microsoft.Getstarted",
"Microsoft.MicrosoftOfficeHub",
"Microsoft.WindowsMaps",
"Microsoft.MicrosoftSolitaireCollection",
"Microsoft.BingWeather",
"Microsoft.WindowsCamera",
"Microsoft.WindowsSoundRecorder",
"Microsoft.WindowsPhone",
"Microsoft.BingSports",
"Microsoft.BingFinance",
"Microsoft.BingNews",
"Microsoft.Windows.Photos",
"Microsoft.People",
#"Microsoft.Office.OneNote",
"Microsoft.XboxGameCallableUI",
"Microsoft.XboxIdentityProvider",
#"Microsoft.XboxApp",
"Microsoft.ZuneVideo",
"Microsoft.ZuneMusic")
$aRemoveBuiltinApps|%{Get-AppxPackage -AllUser $_| Remove-AppxPackage -ErrorAction SilentlyContinue |out-null }


# Hosts known for collecting data
$aDisableHosts=@(
"a-0001.a-msedge.net",
"a-0002.a-msedge.net",
"a-0003.a-msedge.net",
"a-0004.a-msedge.net",
"a-0005.a-msedge.net",
"a-0006.a-msedge.net",
"a-0007.a-msedge.net",
"a-0008.a-msedge.net",
"a-0009.a-msedge.net",
"a-msedge.net",
"a.ads1.msn.com",
"a.ads2.msads.net",
"a.ads2.msn.com",
"a.rad.msn.com",
"ac3.msn.com",
"ad.doubleclick.net",
"adnexus.net",
"adnxs.com",
"ads.msn.com",
"ads1.msads.net",
"ads1.msn.com",
"aidps.atdmt.com",
"aka-cdn-ns.adtech.de",
"az361816.vo.msecnd.net",
"az512334.vo.msecnd.net",
"b.ads1.msn.com",
"b.ads2.msads.net",
"b.rad.msn.com",
"bs.serving-sys.com",
"c.atdmt.com",
"c.msn.com",
"ca.telemetry.microsoft.com",
"cache.datamart.windows.com",
"cdn.atdmt.com",
"cds26.ams9.msecn.net",
"choice.microsoft.com",
"choice.microsoft.com.nsatc.net",
"compatexchange.cloudapp.net",
"corp.sts.microsoft.com",
"corpext.msitadfs.glbdns2.microsoft.com",
"cs1.wpc.v0cdn.net",
"db3aqu.atdmt.com",
"df.telemetry.microsoft.com",
"diagnostics.support.microsoft.com",
"ec.atdmt.com",
"fe2.update.microsoft.com.akadns.net",
"fe3.delivery.dsp.mp.microsoft.com.nsatc.net",
"feedback.microsoft-hohm.com",
"feedback.search.microsoft.com",
"feedback.windows.com",
"flex.msn.com",
"g.msn.com",
"h1.msn.com",
"i1.services.social.microsoft.com",
"i1.services.social.microsoft.com.nsatc.net",
"lb1.www.ms.akadns.net",
"live.rads.msn.com",
"m.adnxs.com",
"msedge.net",
"msftncsi.com",
"msnbot-65-55-108-23.search.msn.com",
"msntest.serving-sys.com",
"oca.telemetry.microsoft.com",
"oca.telemetry.microsoft.com.nsatc.net",
"pre.footprintpredict.com",
"preview.msn.com",
"rad.live.com",
"rad.msn.com",
"redir.metaservices.microsoft.com",
"reports.wes.df.telemetry.microsoft.com",
"schemas.microsoft.akadns.net",
"secure.adnxs.com",
"secure.flashtalking.com",
"services.wes.df.telemetry.microsoft.com",
"settings-sandbox.data.microsoft.com",
"settings-win.data.microsoft.com",
"sls.update.microsoft.com.akadns.net",
"spynet2.microsoft.com",
"spynetalt.microsoft.com",
"sqm.df.telemetry.microsoft.com",
"sqm.telemetry.microsoft.com",
"sqm.telemetry.microsoft.com.nsatc.net",
"ssw.live.com",
"static.2mdn.net",
"statsfe1.ws.microsoft.com",
"statsfe2.update.microsoft.com.akadns.net",
"statsfe2.ws.microsoft.com",
"survey.watson.microsoft.com",
"telecommand.telemetry.microsoft.com",
"telecommand.telemetry.microsoft.com.nsatc.net",
"telemetry.appex.bing.net",
"telemetry.microsoft.com",
"telemetry.urs.microsoft.com",
"vortex-bn2.metron.live.com.nsatc.net",
"vortex-cy2.metron.live.com.nsatc.net",
"vortex-sandbox.data.microsoft.com",
"vortex-win.data.microsoft.com",
"vortex.data.microsoft.com",
"watson.live.com",
"watson.microsoft.com",
"watson.ppe.telemetry.microsoft.com",
"watson.telemetry.microsoft.com",
"watson.telemetry.microsoft.com.nsatc.net",
"wes.df.telemetry.microsoft.com",
"www.msftncsi.com")
$aHostsFile = get-content $ENV:SystemRoot\System32\drivers\etc\hosts
if(!($aHostsFile -match "Disable by privacy script")){Add-Content $ENV:SystemRoot\System32\drivers\etc\hosts "`r`n# Disable by privacy script"}
$aDisableHosts|%{
	if(!($aHostsFile -match "0\.0\.0\.0[\s\t]+$_"))
	{
		Add-Content $ENV:SystemRoot\System32\drivers\etc\hosts ([String]::Format("0.0.0.0      {0}",$_))
	}
}

# Unmount default user profile
& reg unload $sMountPointDefaultUser


