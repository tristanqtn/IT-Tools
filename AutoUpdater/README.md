# Auto Updater Tool

The **Auto Update Tool** is a script designed to simplify the process of updating local packages installed via [Chocolatey](https://chocolatey.org/). This tool not only updates existing packages but also performs a comprehensive cleanup, removing unused packages, old versions, and residual files left behind by uninstalled packages.

## Overview

1. **Chocolatey Updater:**
   - Automatically updates all installed Chocolatey packages to their latest versions.

2. **Cleanup Process:**
   - Identifies and removes unused packages.
   - Cleans up old versions of installed packages.
   - Removes residual files left behind by uninstalled packages.

## Prerequisites

To use the **Auto Updater Tool**, ensure the following prerequisites are met:

- **Chocolatey Installation:**
  - [Install Chocolatey](https://chocolatey.org/install) on your system.

- **Choco-Cleaner Installation:**
  - Install [Choco-Cleaner](https://github.com/deadlydog/ChocolateyPackages/tree/master/choco-cleaner) in the directory: `C:\ProgramData\chocolatey\bin\`.

## Usage

1. **Run the Script:**
   - Execute the script to initiate the update and cleanup process.

3. **Monitor the Process:**
   - Keep an eye on the console for progress updates and any potential error messages.

4. **Verification:**
   - After completion, verify that the updates and cleanup were successful by checking the Chocolatey package list and inspecting the cleanup results.

## Installation

```bash
$ .\auto_updater.exe
```

## Note

- This tool assumes that Chocolatey is installed on your system.
- Make sure Choco-Cleaner is located in `C:\ProgramData\chocolatey\bin\` for the cleanup process to work correctly.

Feel free to customize and adapt this tool to fit your specific needs. Contributions and improvements are always welcome!

---

**Important:** Always review and understand the actions performed by the script, and use it responsibly.

