#################### BACKUP ####################
function Backup {
    # Define the paths and variables for 7-Zip
    $sevenZipPath = "C:\Program Files\7-Zip\7z.exe"
    $archivePath = "C:\<PATH>\Documents.7z"
    $workingDir = "C:\<PATH>\"
    $archivePassword = ""
    $directoriesToSave = @(
        "C:\",
        "C:\"
    )

    # Define the paths and encryption key for AxCrypt
    $axCryptPath = "C:\Program Files\Axantum\AxCrypt\AxCrypt.exe"
    $encryptionKey = ""
    $fileToEncrypt = $archivePath
    $temporaryName = "C:\<PATH>\Documents-7z.axx"

    # External hard drive path
    $externalDrivePath = "E:\<PATH>"

    # Log file path
    $logFilePath = "C:\<PATH>\backup_log.txt"

    # Function to log messages
    function Log-Message {
        param (
            [string]$message
        )
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logEntry = "$timestamp - $message"
        Write-Host $logEntry
        Add-Content -Path $logFilePath -Value $logEntry
    }

    # Step 1: Delete old encrypted archives
    Try {
        Log-Message "Deleting old encrypted archives..."
        Remove-Item -Path "$workingDir\*.axx" -Force -ErrorAction Stop
        Log-Message "Old encrypted archives deleted successfully."
    }
    Catch {
        Log-Message "An error occurred during the deletion process: $_"
        Exit 1
    }

    # Step 2: Create the 7z archive and handle any errors
    Try {
        Log-Message "Starting the archiving process with 7-Zip..."
        
        Start-Process -FilePath "$sevenZipPath" -ArgumentList "u -t7z -m0=LZMA2 -mmt=on -mx9 -md=64m -mfb=64 -ms=4g -mqs=on -sccUTF-8 `"-p$archivePassword`" -bb0 -bse0 -bsp2 `"-w$workingDir`" `"$archivePath`" $directoriesToSave" -Wait

        Log-Message "Archiving completed successfully."
    }
    Catch {
        Log-Message "An error occurred during the archiving process: $_"
        Exit 1
    }

    # Step 3: Encrypt the archive with AxCrypt and handle any errors
    Try {
        Log-Message "Starting the encryption process with AxCrypt..."
        
        # Start the AxCrypt encryption process and wait for it to finish
        Start-Process -FilePath "$axCryptPath" -ArgumentList "-b 2 -e -c -k `"$encryptionKey`" -z `"$fileToEncrypt`"" -Wait
        
        Log-Message "Encryption completed successfully."
    }
    Catch {
        Log-Message "An error occurred during the encryption process: $_"
        Exit 1
    }

    # Step 4: Rename the encrypted archive with the current datetime
    Try {
        Log-Message "Starting the renaming process..."
        
        # Get the current date and time, formatted as "yyyyMMdd-HHmmss"
        $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

        # Extract the directory and file extension
        $directory = Split-Path $temporaryName
        $extension = [System.IO.Path]::GetExtension($temporaryName)

        # Generate the new file name with the timestamp
        $newFileName = "Archive_$timestamp$extension"
        $encryptedArchive = Join-Path $directory $newFileName

        # Rename the file
        Rename-Item -Path $temporaryName -NewName $newFileName -ErrorAction Stop

        Log-Message "Renaming completed successfully."
    }
    Catch {
        Log-Message "An error occurred during the renaming process: $_"
        Exit 1
    }

    # Step 5: Validate if the user wants to copy the encrypted archive to the external hard drive
    $copyConfirmation = Read-Host "Do you want to copy the encrypted archive to the external hard drive? (Y/N)"
    if ($copyConfirmation -eq 'Y' -or $copyConfirmation -eq 'y') {
        Try {
            Log-Message "User confirmed to copy the encrypted archive to the external hard drive."
            
            # Ensure the destination directory exists
            if (-not (Test-Path -Path $externalDrivePath)) {
                Log-Message "Destination directory does not exist. Creating directory..."
                New-Item -Path $externalDrivePath -ItemType Directory -ErrorAction Stop
                Log-Message "Directory created successfully."
            }

            # Copy the file
            Log-Message "Copying the encrypted archive to $externalDrivePath..."
            Copy-Item -Path $encryptedArchive -Destination $externalDrivePath -Force -ErrorAction Stop
            Log-Message "Encrypted archive copied to $externalDrivePath successfully."
        }
        Catch {
            Log-Message "An error occurred while copying the file to the external hard drive: $_"
            Exit 1
        }
    } else {
        Log-Message "User chose not to copy the encrypted archive to the external hard drive."
    }

    Log-Message "Script completed successfully."
}

Backup