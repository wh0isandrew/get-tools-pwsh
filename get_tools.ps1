$DownloadDirectory = "$env:USERPROFILE\Downloads\SecurityTools"
if (-not (Test-Path -Path $DownloadDirectory)) {
    New-Item -ItemType Directory -Path $DownloadDirectory | Out-Null
    Write-Host "Created download directory at $DownloadDirectory"
}


$tools = @(
    @{ Name = "Wireshark"; URL = "https://2.na.dl.wireshark.org/win64/Wireshark-4.4.3-x64.exe" },
    @{ Name = "Process Hacker"; URL = "https://sourceforge.net/projects/systeminformer/files/systeminformer-3.2.25004-release-setup.exe/download" },
    @{ Name = "Procmon"; URL = "https://download.sysinternals.com/files/ProcessMonitor.zip" },
    @{ Name = "Process Explorer"; URL = "https://download.sysinternals.com/files/ProcessExplorer.zip" },
    @{ Name = "Volatility"; URL = "https://github.com/volatilityfoundation/volatility/releases/download/2.6.1/volatility-2.6.zip" },
    @{ Name = "Python3.8"; URL = "https://www.python.org/ftp/python/3.8.0/python-3.8.0-amd64.exe" }
)


foreach ($tool in $tools) {
    $extension = if ($tool.URL -match "\.exe$") { ".exe" } else { ".zip" }
    $filePath = Join-Path -Path $DownloadDirectory -ChildPath ($tool.Name + $extension)

    try {
        Write-Host "Downloading $($tool.Name)..."
        Invoke-WebRequest -Uri $tool.URL -OutFile $filePath -UseBasicParsing
        Write-Host "$($tool.Name) downloaded successfully to $filePath"
    } catch {
        Write-Host "Failed to download $($tool.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}


$PythonInstaller = Join-Path -Path $DownloadDirectory -ChildPath "Python3.8.exe"
if (Test-Path $PythonInstaller) {
    Write-Host "Installing Python 3.8.0..."
    Start-Process -FilePath $PythonInstaller -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
    Write-Host "Python 3.8.0 installed successfully."
} else {
    Write-Host "Python installer not found. Please check the download step." -ForegroundColor Red
    exit
}

Write-Host "Installing Volatility dependencies..."
$requirements = @("distorm3", "pycrypto", "Pillow", "openpyxl", "ujson")
foreach ($library in $requirements) {
    try {
        Write-Host "Installing $library..."
        & python -m pip install $library
        Write-Host "$library installed successfully."
    } catch {
        Write-Host "Failed to install $library: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "All tools and dependencies installed successfully. Files are saved in $DownloadDirectory"
