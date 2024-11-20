# automated_monitoring.ps1 for macOS

# Get the current directory of the script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Starting system monitoring..."

# Run the CPU monitoring script
& "$scriptDir/cpu_monitor.ps1"

# Run the memory monitoring script
& "$scriptDir/memory_monitor.ps1"

# Run the disk space monitoring script
& "$scriptDir/disk_space_monitor.ps1"

Write-Host "System monitoring completed."
