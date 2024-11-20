# cpu_monitor.ps1 for macOS
$cpuUsage = (top -l 1 -s 0 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
$threshold = 90

if ($cpuUsage -gt $threshold) {
    Write-Host "Warning: CPU usage is above $threshold% - Current CPU usage: $cpuUsage%"
}
else {
    Write-Host "CPU usage is under control: $cpuUsage%"
}
