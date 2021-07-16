Write-Output "Removing AppxPackages" 

$aRemoveBuiltinApps=@(
"*XboxGameCallableUI",
"*3DBuilder",
"*3DViewer",
"*BingFinance",
"*BingNews",
"*BingSports",
"*BingWeather",
"*FeedbackHub",
"*GetHelp",
"*Getstarted",
"*Messaging",
"*Mixedreality*",
"*OfficeHub",
"*Print3d*",
"*Solitaire*",
"*SkypeApp",
"*StickyNotes",
"*Wallet",
"*WindowsAlarms*",
"*WindowsCamera",
"*WindowsCommunicationApps*",
"*WindowsMaps",
"*WindowsSoundRecorder",
"*WindowsPhone",
#"*Photos",
"*People",
#"*Office.OneNote",
"*Xbox.TCUI*",
"*XboxGaming*",
"*XboxIdentityProvider",
"*XboxGameOverlay*",
"*XboxSpeech*",
"*ZuneVideo",
"*ZuneMusic")
$aRemoveBuiltinApps|%{Get-AppxPackage -AllUser $_| Remove-AppxPackage -ErrorAction SilentlyContinue |out-null }
$aRemoveBuiltinApps|%{Get-AppxPackage $_| Remove-AppxPackage -ErrorAction SilentlyContinue |out-null }

Write-Output "Done removing AppxPackages"
