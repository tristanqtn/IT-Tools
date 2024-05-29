# Chocolatey Package Installer

This PowerShell script helps you to install and manage various software packages on your Windows machine using the [Chocolatey package manager](https://chocolatey.org/).

## Prerequisites

- Windows 7 or later
- PowerShell 3.0 or later

## Installation

1. Open PowerShell with administrative privileges.
2. Set the execution policy to allow running unsigned scripts:

```
Set-ExecutionPolicy RemoteSigned
```

3. Run the following command to install the script:

```powershell
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/tristanqtn/it-tools/main/ChocolateyPackageInstaller.ps1' -OutFile 'C:\Path\To\ChocolateyPackageInstaller.ps1'
```

Replace `<username>` and `<repository>` with the actual values for your GitHub repository.

## Usage

1. Open PowerShell with administrative privileges.
2. Navigate to the directory where the script is saved.
3. Run the script:

```powershell
.\ChocolateyPackageInstaller.ps1
```

The script will install the following software packages using Chocolatey:

- Chocolatey (package manager)
- Choco-Cleaner (Chocolatey cache cleaner)
- Git (version control system)
- Python (programming language)
- MobaXTerm (terminal emulator)
- Visual Studio Code (code editor)
- Docker Desktop (Docker and Kubernetes development environment)
- Obsidian (markdown knowledge base)
- 7zip (file archiver)
- VirtualBox (virtualization software)

The script will display the installation progress for each package.

## Customization

You can customize the script to install additional or different software packages by modifying the `Install-Package` function in the script. The function takes two parameters:

- `$PackageName`: the name of the Chocolatey package to install
- `$Message`: the message to display while installing the package (optional)

For example, to install the [Google Chrome](https://chocolatey.org/packages/googlechrome) package, add the following line to the function:

```powershell
Install-Package "googlechrome" "Installing Google Chrome..."
```

You can also modify the colors of the messages displayed by the script by changing the `-ForegroundColor` parameter in the `Write-Host` cmdlet.

## License

This script is licensed under the [MIT License](https://opensource.org/licenses/MIT).
