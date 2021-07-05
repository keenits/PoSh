$sessions = query session | ?{ $_ -notmatch ‘^ SESSIONNAME’ } | %{
$userID = “” | Select “Id”
$userID = $_.Substring(39,9).Trim()
$userID
}

foreach ($session in $sessions)
{
logoff $session.Id
}
