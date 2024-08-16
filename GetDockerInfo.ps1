
function checkDockerContainerStatus{param([string]$dockerContainerName)
    $Containers = docker ps --format "{{json .}}" | ConvertFrom-Json
    $Containers = $Containers | Where-Object {$_.NAMES -eq $dockerContainerName}
    $Containers[0].Status -like "*Up*"
}


checkDockerContainerStatus("db-product-default")
