# SysHealthCheck.ps1

# CPU Usage
Write-Host "CPU Usage:"
$cpuUsage = Get-WmiObject Win32_Processor | ForEach-Object {
    [PSCustomObject]@{
        Name           = $_.Name
        LoadPercentage = $_.LoadPercentage
    }
}

$cpuUsage | ForEach-Object {
    Write-Host "Name: $($_.Name)"
    Write-Host "Load Percentage: $($_.LoadPercentage)%"
    Write-Host ""
}

Start-Sleep -Seconds 1

# Memory Usage
Write-Host "Memory Usage:"
$memoryUsage = Get-CimInstance Win32_OperatingSystem | ForEach-Object {
    [PSCustomObject]@{
        TotalVisibleMemory = [math]::round($_.TotalVisibleMemorySize / 1KB, 2)
        FreePhysicalMemory = [math]::round($_.FreePhysicalMemory / 1KB, 2)
    }
}

$memoryUsage | ForEach-Object {
    Write-Host "Total Visible Memory: $($_.TotalVisibleMemory) MB"
    Write-Host "Free Physical Memory: $($_.FreePhysicalMemory) MB"
    Write-Host ""
}

Start-Sleep -Seconds 1

# Disk Usage
Write-Host "Disk Usage:"
$diskUsage = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    [PSCustomObject]@{
        Name    = $_.Name
        UsedGB  = [math]::round($_.Used / 1GB, 2)
        FreeGB  = [math]::round($_.Free / 1GB, 2)
        TotalGB = [math]::round($_.Used / 1GB, 2) + [math]::round($_.Free / 1GB, 2)
    }
}

$diskUsage | ForEach-Object {
    Write-Host "Drive $($_.Name)"
    Write-Host "Used: $($_.UsedGB) GB"
    Write-Host "Free: $($_.FreeGB) GB"
    Write-Host "Total: $($_.TotalGB) GB"
    Write-Host ""
}

Write-Host "System health check completed."