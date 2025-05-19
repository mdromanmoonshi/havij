# Enable TLS 1.2 support
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12

# Set download URL
$DownloadURL = 'https://raw.githubusercontent.com/mdromanmoonshi/havij/main/oneclick.bat'

# Set Desktop path and create 'Arena' folder if it doesn't exist
$DesktopPath = [Environment]::GetFolderPath('Desktop')
$FolderPath = Join-Path $DesktopPath 'Arena'

if (-not (Test-Path $FolderPath)) {
    New-Item -Path $FolderPath -ItemType Directory | Out-Null
}

# Set destination file path
$FilePath = Join-Path $FolderPath 'havij.bat'

# Attempt to download the file
try {
    Invoke-WebRequest -Uri $DownloadURL -OutFile $FilePath
} catch {
    Write-Error "Error downloading the file: $_"
    return
}

# If the file exists, run it and then delete it
if (Test-Path $FilePath) {
    Start-Process $FilePath -Wait
    Remove-Item $FilePath -Force
}
