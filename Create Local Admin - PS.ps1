New-LocalUser -AccountNeverExpires:$true -Password ( ConvertTo-SecureString -AsPlainText -Force 'somepassword') -Name '
someuser' | Add-LocalGroupMember -Group administrators
