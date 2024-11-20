# disk_space_monitor.ps1 for macOS

$threshold = 10 # in GB

# Get disk usage and extract the free space value
$diskUsage = df -h / | awk 'NR==2 {print $4}'

# Handle both Gi and G suffixes (binary and decimal GB)
if ($diskUsage -match '(\d+\.?\d*)([A-Za-z]+)') {
    $freeSpace = [double]$matches[1]

    # If the suffix is 'Gi' (binary), convert to GB (decimal)
    if ($matches[2] -eq "Gi") {
        $freeSpace = $freeSpace * 1.073741824  # 1 GiB = 1.073741824 GB
    }

    # Compare the free space with the threshold
    if ($freeSpace -lt $threshold) {
        Write-Host "Warning: Low disk space. Free space: $freeSpace GB"
    }
    else {
        Write-Host "Disk space is sufficient. Free space: $freeSpace GB"
    }
}
else {
    Write-Host "Unable to parse disk space."
}
