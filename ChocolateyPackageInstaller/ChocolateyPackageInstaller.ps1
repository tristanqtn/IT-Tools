# Set execution policy to bypass for the current session
Set-ExecutionPolicy Bypass -Scope Process -Force

# Enable TLS 1.2 for older systems
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Function to install a package using Chocolatey and display a message
function Install-Package {
    param(
        [string]$PackageName,
        [string]$Message = "Installing {0}..."
    )
    Write-Host -ForegroundColor Green ($Message -f $PackageName)
    choco install $PackageName -y > $null
}

# Install Chocolatey
Write-Host -ForegroundColor Yellow "Installing Chocolatey..."
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Choco-Cleaner
Install-Package "choco-cleaner"

# Install packages
Install-Package "git"
Install-Package "python"
Install-Package "mobaxterm"
Install-Package "vscode"
Install-Package "docker-desktop"
Install-Package "obsidian"
Install-Package "7zip"
Install-Package "virtualbox"
Install-Package "github-desktop"
Install-Package "keepassxc"
Install-Package "brave"

# Complete message
Write-Host -ForegroundColor Green "All packages have been installed successfully!"
