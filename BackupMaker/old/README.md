# Backup Maker

The **Backup Maker** is a utility designed to automate the process of creating a secure backup of your important files. It follows a multi-step approach to ensure the confidentiality and integrity of your data.

## Overview

1. **7Zip Archive Creation:**
   - Generates a 7Zip archive of specified files and directories.
   - Secures the archive with a password chosen by the user.

2. **Encryption with AxCrypt:**
   - Encrypts the 7Zip archive using AxCrypt, providing an additional layer of security.
   - Requires a second password for AxCrypt encryption.

3. **Copying to External SSD:**
   - Copies the encrypted archive to an external Solid State Drive (SSD) designated with the letter 'E:'.
   - Ensures a redundant and physically separate backup location.

4. **Password Vault Backup:**
   - Safeguards the backup of a password vault, ensuring the protection of crucial credentials.

## Prerequisites

To use the **Backup Maker**, the following software and hardware components are required:

- **7Zip:**
  - [Download and install 7Zip](https://www.7-zip.org/download.html).

- **AxCrypt:**
  - [Download and install AxCrypt](https://www.axcrypt.net/download/).

- **External Mass Storage:**
  - An external Solid State Drive (SSD) designated with the letter 'E:'.
  - Ensure that the external SSD is connected and accessible.

## Usage

1. **Personalization:**
   - Customize the tool to adapt to your directory architecture by modifying the configuration settings within the program.

2. **Run the Program:**
   - Execute the program to initiate the backup process.
   - Follow the on-screen prompts to enter the required passwords and confirm the backup.

3. **Monitor the Process:**
   - Keep an eye on the console for progress updates and any potential error messages.
   - The program will automatically handle the creation, encryption, and copying of the backup.

4. **Verify Backup:**
   - After completion, verify the backup files on the external SSD and ensure the integrity of the password vault backup.

## Installation

When you download the project you can either recompile the C++ project or us the already built one. You should rename all files ending with a `.example` to a `.bat` to make them usable. Finally make sure to change all pathes to adapt to your file system. 

**Important**: Change all passwords with strong ones and store those passwords in a key vault.

Store the `.exe` where ever you want along the `.dll` files provided here. Then launch the tool with:

```bash
$ .\backup_maker.exe
```

## Note

- This program requires careful personalization to align with your specific directory structure.
- Ensure that the external SSD is connected and recognized by the system.
- Regularly update passwords and review the backup process for any changes in the future.

By automating the backup process with the **Backup Maker**, you enhance the security of your crucial data and streamline the backup routine, contributing to an efficient and organized IT workflow.
