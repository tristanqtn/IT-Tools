# Backup Script Documentation

## Overview

This PowerShell script automates the process of creating backups by compressing specified directories using 7-Zip, encrypting the compressed archive with AxCrypt, and optionally copying the encrypted archive to an external hard drive. The script logs each step of the process, ensuring that any issues are captured for troubleshooting.

## Prerequisites

Before using the script, ensure that the following software is installed on your system:

### 1. 7-Zip

7-Zip is a file archiver that supports various file formats, including `.7z`, which this script uses for compression.

- **Installation Path:** `C:\Program Files\7-Zip\7z.exe`
- **Download:** [7-Zip Official Website](https://www.7-zip.org/)

### 2. AxCrypt

AxCrypt is a file encryption software used to secure the `.7z` archive created by the script.

- **Installation Path:** `C:\Program Files\Axantum\AxCrypt\AxCrypt.exe`
- **Download:** [AxCrypt Official Website](https://www.axcrypt.net/)

## Installation

### 1. Download the Script

1. Create a new `.ps1` file (e.g., `BackupScript.ps1`) in your preferred directory.
2. Copy and paste the script provided above into this file.

### 2. Add the Script to PowerShell Profile

To make the script easily accessible from any PowerShell session, you can add it to your PowerShell profile.

1. Open your PowerShell profile in a text editor. If you don't have a profile, create one using the following command:

   ```powershell
   if (!(Test-Path -Path $PROFILE)) {
       New-Item -ItemType File -Path $PROFILE -Force
   }
   notepad $PROFILE
   ```

2. Add the following line to your profile to import the script whenever you start a PowerShell session:

   ```powershell
   . "C:\<PATH_TO_SCRIPT>\BackupScript.ps1"
   ```

3. Save and close the profile file.

## Usage

Before running the script, update the following paths and variables within the script according to your setup:

### 1. Modify Script Paths and Variables

- **$sevenZipPath:** The path to the 7-Zip executable.
- **$archivePath:** The path where the `.7z` archive will be saved.
- **$workingDir:** The working directory for 7-Zip.
- **$archivePassword:** The password to protect the `.7z` archive (optional, but recommended).
- **$directoriesToSave:** An array of directories that you want to back up.
- **$axCryptPath:** The path to the AxCrypt executable.
- **$encryptionKey:** The encryption key for AxCrypt.
- **$temporaryName:** The temporary name for the encrypted file.
- **$externalDrivePath:** The path to the external drive where the encrypted file will be copied.
- **$logFilePath:** The path to the log file where the script's output will be stored.

Example paths to update:

```powershell
$archivePath = "C:\Backups\Documents.7z"
$workingDir = "C:\Backups\"
$directoriesToSave = @("C:\Users\<YourUserName>\Documents", "C:\Users\<YourUserName>\Pictures")
$axCryptPath = "C:\Program Files\Axantum\AxCrypt\AxCrypt.exe"
$encryptionKey = "<YourAxCryptKey>"
$archivePassword = "<YouArchivePassword>"
$externalDrivePath = "E:\Backups"
$logFilePath = "C:\Backups\backup_log.txt"
```

### 2. Running the Script

To execute the backup script, open PowerShell and run the following command:

```powershell
Backup
```

The script will perform the following steps:

1. **Delete Old Encrypted Archives:** Deletes any existing encrypted files (`.axx`) in the working directory.
2. **Create the 7z Archive:** Compresses the specified directories into a `.7z` archive.
3. **Encrypt the Archive:** Encrypts the `.7z` archive using AxCrypt.
4. **Rename the Encrypted Archive:** Renames the encrypted file with a timestamp.
5. **Copy to External Drive (Optional):** Prompts you to copy the encrypted archive to an external hard drive.

### 3. Log File

All actions taken by the script are logged in the specified log file (`$logFilePath`). Review this file if any errors occur during the backup process.

### 4. Handling Errors

If any step fails, the script will log the error and exit with a status code of `1`. You can check the log file to diagnose and resolve any issues.

### 5. Scheduling the Script

For regular backups, consider scheduling the script to run automatically using the Windows Task Scheduler.

- **Open Task Scheduler** and create a new task.
- **Set the Trigger** to the desired schedule (e.g., daily, weekly).
- **Set the Action** to run `powershell.exe` with the argument pointing to your script:

  ```powershell
  -File "C:\<PATH_TO_SCRIPT>\BackupScript.ps1"
  ```

This setup ensures your files are regularly backed up and encrypted securely.
