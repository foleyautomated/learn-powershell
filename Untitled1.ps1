



# Replace with your internal and external addresses
$internalAddress = "https://nexus.flooidcloudhosting.com/repository/nexus"  # Replace with your internal IP
$externalAddress = "google.com"

$html = Invoke-WebRequest $internalAddress
Write-Host $html.Content


$ipAddresses = [System.Net.Dns]::GetHostAddresses($internalAddress)
Write-Host $ipAddresses

# Ping both addresses and store the results
$internalPing = Test-Connection -ComputerName $internalAddress -Count 2 -Quiet
$externalPing = Test-Connection -ComputerName $externalAddress -Count 2 -Quiet

Write-Host $internalPing
Write-Host $externalPing

# Check the results
if ($internalPing -and -not $externalPing) {
    Write-Host "You are likely connected to a VPN"
} elseif ($internalPing -and $externalPing) {
    Write-Host "You are likely not connected to a VPN"
} else {
    Write-Host "Unable to determine VPN connection"
}