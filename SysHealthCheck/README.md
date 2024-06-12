# SysHealthCheck

## Overview

**SysHealthCheck** is a PowerShell script designed to provide a quick overview of your system's health by displaying CPU usage, memory usage, and disk usage. This script is useful for monitoring and diagnosing potential performance issues on your Windows machine.

## Contents

- `healthcheck.ps1`: The main PowerShell script that performs the system health check.

## Instructions

### Prerequisites

Ensure you have PowerShell installed on your system. This script is compatible with PowerShell 5.1 and later versions.

### Usage

1. **Download the Script**:
   Save the script to a file named `healthcheck.ps1` or `healthcheck.sh` depending on your environment.

2. **Run the Script**:
   Open PowerShell and navigate to the directory where the script is saved. Then, execute the script by running:

   ```powershell
   .\healthcheck.ps1
   ```

   ```shell
   chmod +x ./healthcheck.sh
   ./healthcheck.sh
   ```

3. **Output**:
   The script will display the following information:
   - **CPU Usage**: Displays the load percentage of each processor.
   - **Memory Usage**: Displays the total visible memory and the free physical memory.
   - **Disk Usage**: Displays the used, free, and total space for each filesystem drive in gigabytes.

### Example Output

```plaintext
CPU Usage:
Name             LoadPercentage
----             --------------
Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz  15

Memory Usage:
TotalVisibleMemorySize FreePhysicalMemory
---------------------- ------------------
16328460               6749028

Disk Usage:
Name Used (GB) Free (GB) Total (GB)
---- --------- --------- ----------
C    123.45    456.78    580.23
D    50.12     200.45    250.57

System health check completed.
```

## License

This script is licensed under the [MIT License](https://opensource.org/licenses/MIT).
