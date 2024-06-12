# Git Puller

## Content

Git Puller is a set of scripts designed to automate the process of updating multiple git repositories within a specified directory. It includes a Bash script for Linux/macOS and a PowerShell script for Windows.

- `puller.sh`: A Bash script for Linux/macOS.
- `puller.ps1`: A PowerShell script for Windows.

## Instructions

### Prerequisites

Ensure you have git installed on your system and that it is available in your system's PATH.

### Usage

1. **Bash Script (Linux/macOS)**

   - Save the script to a file named `puller.sh`.
   - Make the script executable:
     ```bash
     chmod +x puller.sh
     ```
   - Run the script, providing the path to the directory containing your git repositories:
     ```bash
     ./puller.sh /path/to/your/repos
     ```

2. **PowerShell Script (Windows)**

   - Save the script to a file named `puller.ps1`.
   - Open PowerShell and navigate to the directory containing the script.
   - Run the script, providing the path to the directory containing your git repositories:
     ```powershell
     .\puller.ps1 -repoDir 'C:\path\to\your\repos'
     ```

## License

This script is licensed under the [MIT License](https://opensource.org/licenses/MIT).
