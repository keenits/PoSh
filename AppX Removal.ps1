Write-Output "Remove-AppxPackage -AllUsers" 

  Get-AppxPackage *3DBuilder* | Remove-AppxPackage -AllUsers
  Get-AppxPackage *3DViewer* | Remove-AppxPackage
  Get-AppxPackage *BingWeather* | Remove-AppxPackage
  Get-AppxPackage *BingSports*| Remove-AppxPackage -AllUsers
  Get-AppxPackage *BingNews* | Remove-AppxPackage -AllUsers
  Get-AppxPackage *BingFinance* | Remove-AppxPackage -AllUsers
  Get-AppxPackage *FeedbackHub* | Remove-AppxPackage
  Get-AppxPackage *GetHelp* | Remove-AppxPackage
  Get-AppxPackage *Messaging* | Remove-AppxPackage
  Get-AppxPackage *Mixedreality* | Remove-AppxPackage
  Get-AppxPackage *People* | Remove-AppxPackage
  Get-AppxPackage *Print3d* | Remove-AppxPackage
  Get-AppxPackage *SkypeApp* | Remove-AppxPackage
  Get-AppxPackage *Solitaire* | Remove-AppxPackage
  Get-AppxPackage *SoundRecorder* | Remove-AppxPackage
  Get-AppxPackage *StickyNotes* | Remove-AppxPackage
  Get-AppxPackage *Wallet* | Remove-AppxPackage
  Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage
  Get-AppxPackage *WindowsCamera* | Remove-AppxPackage
  Get-AppxPackage *WindowsCommunicationApps* | Remove-AppxPackage -AllUsers
  Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
  Get-AppxPackage *WindowsPhone*| Remove-AppxPackage -AllUsers
  Get-AppxPackage *XboxGameOverlay* | Remove-AppxPackage
  Get-AppxPackage *XboxIdentityProvider* | Remove-AppxPackage
  Get-AppxPackage *Xbox.TCUI* | Remove-AppxPackage
  Get-AppxPackage *XboxSpeechToTextOverlay* | Remove-AppxPackage
  Get-AppxPackage *Zune* | Remove-AppxPackage

Write-Output "Done removing appx packages"
