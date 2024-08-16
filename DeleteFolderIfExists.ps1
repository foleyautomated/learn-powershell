function Remove-DirectoryIfExists {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Path
    )

    if (Test-Path $Path -PathType Container) {
        Write-Host "Deleting " + $dir
        Write-Host "Click 'Enter' To Confirm, or close to abort"
        $confirmation = Read-Host
        Remove-Item $Path -Recurse -Force
        Write-Host "Directory '$Path' deleted successfully."
    } else {
        Write-Host "Directory '$Path' does not exist."
    }
}



$webappsDir="C:\Users\DavidFoley\_Tomcats\tomcat\webapps"

$tomcatWebappsDirCleanupList = @(
    "esi-customerservice"
    "esp-customerprocessor-war"
    "BeanstoreServer"
    "esp-transactiongateway"
)

foreach ($dirname in $tomcatWebappsDirCleanupList) {
    
    $dir = "$webappsDir\$dirname"
    Remove-DirectoryIfExists($dir);
}