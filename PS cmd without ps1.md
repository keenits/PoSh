# PoSh

Single:
powershell -command "& {&'some-command' someParam}"

Multiple:
powershell -command "& {&'some-command' someParam}"; "& {&'some-command' -SpecificArg someParam}"
powershell -command "& {$someVar = 'test'; &'Write-Host' $someVar}"

Example:
powershell -command "& {&'Import-Module' AppLocker}"; "& {&'Set-AppLockerPolicy' -XmlPolicy myXmlFilePath.xml}"
