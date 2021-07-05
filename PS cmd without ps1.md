# PoSh

Single:
powershell -command "& {&'some-command' someParam}"

Multiple:
powershell -command "& {&'some-command' someParam}"; "& {&'some-command' -SpecificArg someParam}"

Example:
powershell -command "& {&'Import-Module' AppLocker}"; "& {&'Set-AppLockerPolicy' -XmlPolicy myXmlFilePath.xml}"
