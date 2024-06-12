#################### STYLE ########################
oh-my-posh init pwsh --config 'C:\Users\PATH\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json' | Invoke-Expression

#################### LOCATIONS ####################
function github {
    Set-Location -Path 'C:\PATH\GitHub'
}

function downloads {
    Set-Location -Path 'C:\PATH\Downloads'
}

function documents {
    Set-Location -Path 'C:\PATH\Documents'
}


#################### COMMANDS #####################

function ll {
    Get-ChildItem -Path ./ -Force
}

function disk_usage {
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name = "UsedGB"; Expression = { [math]::round(($_.Used / 1GB), 2) } }, @{Name = "FreeGB"; Expression = { [math]::round(($_.Free / 1GB), 2) } }, @{Name = "TotalGB"; Expression = { [math]::round(($_.Used / 1GB) + ($_.Free / 1GB), 2) } }
}

function SysHealth {
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

}

### FILES

function file_size {
    param (
        [string]$FilePath
    )

    if (Test-Path $FilePath) {
        $file = Get-Item $FilePath
        [math]::round($file.Length / 1MB, 2)
    }
    else {
        Write-Host "File not found: $FilePath"
    }
}

function file_compress {
    param (
        [string]$SourceDir,
        [string]$DestinationZip
    )

    if (Test-Path $SourceDir) {
        Add-Type -AssemblyName "System.IO.Compression.FileSystem"
        [System.IO.Compression.ZipFile]::CreateFromDirectory($SourceDir, $DestinationZip)
        Write-Host "Files compressed into: $DestinationZip"
    }
    else {
        Write-Host "Source directory not found: $SourceDir"
    }
}


function file_decompress {
    param (
        [string]$ZipFilePath,
        [string]$DestinationDir
    )

    if (Test-Path $ZipFilePath) {
        Add-Type -AssemblyName "System.IO.Compression.FileSystem"
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFilePath, $DestinationDir)
        Write-Host "Files extracted to: $DestinationDir"
    }
    else {
        Write-Host "ZIP file not found: $ZipFilePath"
    }
}

### NETWORK

function test_internet {
    param (
        [string]$TestUrl = "www.google.com"
    )

    try {
        Test-Connection -ComputerName $TestUrl -Count 1 -ErrorAction Stop
        Write-Host "Internet connection is active."
        return $true
    }
    catch {
        Write-Host "No internet connection."
        return $false
    }
}

#################### ENVIRONMENTS ####################
function CreatePyVenv {
    # Get the current directory's name
    # Modify the name for the virtual environment
    $venvName = ".venv"
    # Create the virtual environment
    python -m venv $venvName

    # Print a message to confirm the virtual environment is active
    Write-Host "The virtual environment $venvName is now created. To activate it manually, run the following command (in the current directory):"
    Write-Host ".\$venvName\Scripts\Activate.ps1"

    # Deploy API endpoint in separate console window
    Write-Host "`nOpening .venv..."
    try {
        Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", "& { .\$venvName\Scripts\Activate.ps1; Write-Host 'The virtual environment is now active.'}"
        Start-Sleep -Seconds 5
    }
    catch {
        Write-Error "Failed to enable .venv: $_"
    }
}


#################### PACKAGES ####################
function ChocoUpgradeAll {
    # check that you are running as an administrator
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
        Write-Warning "You are not running as an administrator. Please run this script as an administrator."
        return
    }
    # else upgrade all packages
    choco upgrade all -y
}
function InstallPackage {
    param(
        [string]$PackageName,
        [string]$Message = "Installing {0}..."
    )
    Write-Host -ForegroundColor Green ($Message -f $PackageName)
    choco install $PackageName -y > $null
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}