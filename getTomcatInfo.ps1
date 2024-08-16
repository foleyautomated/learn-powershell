Get-Process | Where-Object {$_.ProcessName -eq "java" -and $_.CommandLine -like "*tomcat*"}
