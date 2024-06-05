#################### STYLE ########################
oh-my-posh init pwsh --config 'C:\Users\PATH\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json' | Invoke-Expression

#################### LOCATIONS ####################
function github{
    Set-Location -Path 'C:\PATH\GitHub'
}

function downloads{
    Set-Location -Path 'C:\PATH\Downloads'
}

function documents{
    Set-Location -Path 'C:\PATH\Documents'
}


#################### COMMANDS #####################

function ll{
    Get-ChildItem -Path ./ -Force
}

function disk_usage {
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name="UsedGB";Expression={[math]::round(($_.Used/1GB),2)}}, @{Name="FreeGB";Expression={[math]::round(($_.Free/1GB),2)}}, @{Name="TotalGB";Expression={[math]::round(($_.Used/1GB) + ($_.Free/1GB),2)}}
}

### FILES

function file_size {
    param (
        [string]$FilePath
    )

    if (Test-Path $FilePath) {
        $file = Get-Item $FilePath
        [math]::round($file.Length / 1MB, 2)
    } else {
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
    } else {
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
    } else {
        Write-Host "ZIP file not found: $ZipFilePath"
    }
}

### NETWORK

function test_internet{
    param (
        [string]$TestUrl = "www.google.com"
    )

    try {
        $ping = Test-Connection -ComputerName $TestUrl -Count 1 -ErrorAction Stop
        Write-Host "Internet connection is active."
        return $true
    } catch {
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
    try{
        Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", "& { .\$venvName\Scripts\Activate.ps1; Write-Host 'The virtual environment is now active.'}"
        Start-Sleep -Seconds 5
    }
    catch {
        Write-Error "Failed to enable .venv: $_"
    }
}
