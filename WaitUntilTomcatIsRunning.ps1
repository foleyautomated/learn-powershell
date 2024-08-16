



function waitUntilTomcat() {
    $tomcatIsRunning=$false
    while (-not $tomcatIsRunning) {
        $tomcatProcess = Get-Process -Name java
            if ($tomcatProcess) {
                Write-Host "Tomcat is running."
                $tomcatIsRunning = $true
            } else {
                Write-Host "Tomcat is not running. Waiting a few seconds before checking again..."
                Start-Sleep -Seconds 3
            }
    }
    Write-Host "Java Process Found. Hit 'Enter' To confirm Tomcat is running"
    $null = Read-Host
    $tomcatProcess
}

waitUntilTomcat
