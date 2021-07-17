$ErrorActionPreference = "SilentlyContinue"

Write-Output "Removing AppxPackages" 
    $aRemoveBuiltinApps=@(
    "*3DBuilder",
    "*3DViewer",
    "*BingFinance",
    "*BingNews",
    "*BingSports",
    "*BingWeather",
    "*CBSPreview",
    "*GetHelp",
    "*Getstarted",
    "*HPPrinter*",
    "*Messaging",
    "*MixedReality*",
    "*OneNote",
    "*Print3D",
    "*ScreenSketch",
    "*Solitaire*",
    "*SkypeApp",
    "*StickyNotes",
    "*Wallet",
    "*WindowsAlarms*",
    "*WindowsCamera",
    "*WindowsCommunicationApps*",
    "*WindowsFeedbackHub",
    "*WindowsMaps",
    "*MicrosoftOfficeHub",
    "*WindowsSoundRecorder",
    "*WindowsPhone",
#    "*Photos",
    "*People",
    "*Office.OneNote",
    "*Xbox.TCUI*",
    "*XboxApp",
    "*XboxGaming*",
    "*XboxIdentityProvider",
    "*XboxSpeech*",
    "*ZuneVideo",
    "*ZuneMusic")
    $aRemoveBuiltinApps|%{Get-AppxPackage -AllUsers $_ | Remove-AppxPackage | Remove-AppxProvisionedPackage -Online | Out-Null }

Write-Output "Done removing AppxPackages"
