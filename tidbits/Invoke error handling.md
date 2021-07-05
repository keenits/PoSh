# PoSh

$results = Invoke-Command -ComputerName server.contoso.com -ScriptBlock {
   try
   {
       New-Service -ErrorAction 1
   }
   catch
   {
       <log to file, do cleanup, etc>
       return $_
   }
   <do stuff that should only execute when there are no failures>
}
$results now contains the error information.
