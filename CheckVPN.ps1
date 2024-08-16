
function checkVpnConnection() {
    $ciscoAdapterStatus = (Get-NetAdapter  | Where-Object {$_.InterfaceDescription -like "*AnyConnect*"}).Status
    $ciscoAdaptreStatus -eq "Up"
}

$vpnIsConnected = checkVpnConnection

If($vpnIsConnected) {
    Write-Host "The VPN Is Connected. Continuing Install..." -ForegroundColor Green
} else {
    Write-Host "The VPN Is Not Connected. Connect and hit 'Enter' to continue this Install." -ForegroundColor Red
}


