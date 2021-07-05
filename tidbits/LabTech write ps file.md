Folder Create c:\labtech-scripts

File Write Text Text File: c:\labtech-scripts\hello.ps1 data: <your powershell code>

Shell as Admin Command: powershell.exe -ExecutionPolicy ByPass -File "c:\labtech-scripts\hello.ps1"

Script Log Message ECHO Result: %shellresult% - put this in for debugging

Shell as Admin type "c:\labtech-scripts\hello.ps1" - more debugging

Script Log Message TYPE Result: %shellresult% -more debugging
