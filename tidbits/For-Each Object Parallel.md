$test = 'sid-500.com','orf.at','8.8.8.8','cnn.com'
 
$test | ForEach-Object -Parallel {Test-Connection -TargetName $_}
