# memory_monitor.ps1 for macOS
$memoryInfo = vm_stat | grep "Pages free"
$freeMemory = [int]($memoryInfo -split ":")[1] * 4096 / 1MB
$threshold = 500

if ($freeMemory -lt $threshold) {
    Write-Host "Warning: Memory usage is high. Free memory: $freeMemory MB"
}
else {
    Write-Host "Memory usage is normal. Free memory: $freeMemory MB"
}
