Write-Output "Downloading LayoutModification file..."
    $download = "https://raw.githubusercontent.com/keenits/PoSh/main/Automation/Files/LayoutModification.xml"
    $output = "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml"
    Invoke-RestMethod -Uri $download -OutFile $output

Write-Output "Loading default profile reg hive..."
    reg load HKLM\DEFAULT c:\users\default\ntuser.dat

Write-Output "Configuring browser settings..."
    reg add "HKLM\DEFAULT\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "FormSuggest Passwords" /t REG_SZ /d - /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "https://www.google.com/" /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Internet Explorer\Main" /v "FormSuggest Passwords" /t REG_SZ /d no /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Internet Explorer\Main" /v "FormSuggest PW Ask" /t REG_SZ /d no /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /t REG_SZ /d yes /f
Write-Output "Disabling Feedback..."
    reg add "HKLM\DEFAULT\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f
Write-Output "Disabling Application suggestions..."
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreIntalledAppsEnabled" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledApsEverEnabled" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled"/t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
Write-Output "Configuring Explorer settings..."
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" /t REG_SZ /d "yes" /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DontUsePowerShellOnWinX /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShellState /t REG_BINARY /d 240000001C28000000000000000000000000000001000000130000000000000062000000 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v FullPath /t REG_DWORD /d 1 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v Settings /t REG_BINARY /d 0c00020b01000060000000 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
Write-Output "Hiding Task View button..."
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
Write-Output "Hiding People icon..."
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
Write-Output "Showing file operations details..."
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v EnthusiastMode /t REG_DWORD /d 1 /f
Write-Output "Cleaning up the taskbar..."
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\TaskBand" /v Favorites /t REG_BINARY /d ff /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f
    reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAVolume /t REG_DWORD /d 1 /f
Write-Output "Disabling Tailored Experiences..."
    reg add "HKLM\DEFAULT\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d 1 /f
Write-Output "Configuring desktop settings..."
    reg add "HKLM\DEFAULT\Control Panel\Desktop" /v Wallpaper /t REG_SZ /f
    reg add "HKLM\DEFAULT\Control Panel\Colors" /v Background /t REG_SZ /d "0 99 177" /f
Write-Output "Disabling people band..."    
    reg add "HKLM\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
Write-Output "Configuring console settings..."
    reg add "HKLM\DEFAULT\Console" /v "CursorSize" /t REG_DWORD /d 50 /f
    reg add "HKLM\DEFAULT\Console" /v "LineWrap" /t REG_DWORD /d 1 /f
    reg add "HKLM\DEFAULT\Console" /v "ScreenBuffer" /t REG_DWORD /d 589889686 /f
    reg add "HKLM\DEFAULT\Console" /v "WindowSize" /t REG_DWORD  /d 4587670 /f
    reg add "HKLM\DEFAULT\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v CursorSize /t REG_DWORD /d 50 /f
    reg add "HKLM\DEFAULT\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v LineWrap /t REG_DWORD /d 1 /f
    reg add "HKLM\DEFAULT\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v ScreenBuffer /t REG_DWORD /d 589889686 /f
    reg add "HKLM\DEFAULT\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v WindowSize /t REG_DWORD  /d 4587670 /f
#Write-Output "Disabling Storage Sense..."
#    reg delete "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy"

Write-Output "Unloading default profile reg hive..."
    reg unload HKLM\DEFAULT
