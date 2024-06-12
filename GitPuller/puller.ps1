param (
    [string]$repoDir
)

# Check if a directory path was provided as an argument
if (-not $repoDir) {
    Write-Host "Usage: .\UpdateRepos.ps1 -repoDir 'C:\path\to\your\repos'"
    exit 1
}

# Check if the provided path is a directory
if (-not (Test-Path -Path $repoDir -PathType Container)) {
    Write-Host "Error: $repoDir is not a valid directory"
    exit 1
}

# Change to the directory containing the repos
Set-Location -Path $repoDir

# Loop through each subdirectory
Get-ChildItem -Directory | ForEach-Object {
    # Check if the directory is a git repository
    if (Test-Path "$($_.FullName)\.git") {
        Write-Host "Pulling latest changes in $($_.Name)"
        # Change to the repository directory
        Set-Location -Path $_.FullName
        # Pull the latest changes
        git pull
        # Change back to the parent directory
        Set-Location -Path $repoDir
    } else {
        Write-Host "$($_.Name) is not a git repository"
    }
}
