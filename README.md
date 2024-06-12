# IT Tools

This repository contains a collection of home-made tools created to streamline and enhance my IT workflow. These tools are designed to address specific tasks and challenges encountered during various IT-related activities.

## Table of Contents

- [Introduction](#introduction)
- [Tools](#tools)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

As an IT enthusiast, I often encounter repetitive tasks and challenges in my workflow. To address these issues and make my work more efficient, I have developed a set of tools that automate certain processes, provide useful functionalities, and generally make my IT tasks more manageable.

Feel free to explore and use these tools in your own projects or workflows. Contributions and suggestions are also welcome.

## Tools

### [Backup Maker](./BackupMaker/)

**Backup Maker** is a versatile command-line utility designed to automate and secure your file backup process. It seamlessly integrates with 7Zip and AxCrypt, creating a two-layered protection system. The tool first generates a 7Zip archive, securing it with a user-defined password. Subsequently, the archive is encrypted using AxCrypt with a second password. The program then ensures the safe transfer of this encrypted backup to an external SSD, designated with the letter 'E:'. Additionally, it takes care of safeguarding a password vault, providing a comprehensive solution for data protection. Personalization options allow users to adapt the tool to their specific directory structures, offering a streamlined and efficient approach to data backup in IT workflows.

More information [here](./BackupMaker//README.md)

### [Auto Updater](./AutoUpdater/)

**Auto Updater Tool** is a script designed to streamline the updating process of local packages installed through Chocolatey. Going beyond simple updates, this tool automates the management of your Chocolatey packages by not only updating them to the latest versions but also performing a thorough cleanup. This includes removing unused packages, cleaning up outdated versions, and eliminating residual files left behind by uninstalled packages. With a focus on simplicity and efficiency, the Auto Updater Tool enhances your Chocolatey experience by maintaining a clean and up-to-date software environment. Ensure you have Chocolatey installed and Choco-Cleaner in the specified directory for optimal performance. Simplify your package management with the Auto Updater Tool!

More information [here](./AutoUpdater/README.md)

### [Chocolatey Package Installer](./ChocolateyPackageInstaller/)

**Chocolatey Package Installer** is a script that is responsible for installing all required packages on a new host. This script will install Chocolatey and use this package manager to install all defined packages.

More information [here](./ChocolateyPackageInstaller/README.md)

### [Enhanced Powershell](./EnhancedPowershell/)

**Enhanced Powershell** is a procedure to follow in order to improve your powershell console. This procedure is using `Oh My Posh` and some nerd fonts.

More information [here](./EnhancedPowershell/README.md)

### [Git Puller](./GitPuller/)

**Git Puller** is a simple script to run inside the folder containing multiple GitHub repos. This script will, for each repo, pull the latest version of it ot make sure you stay up to date.

More information [here](./GitPuller/README.md)

### [Sys Health Check](./SysHealthCheck/)

**Sys Health Check** is a script to run in order to obtain the current ressources usage on your device. This script returns you the CPU usage and the amount of used and free space in your RAM and disk.

More information [here](./SysHealthCheck/README.md)

## Usage

For each tool, you will find specific instructions on usage in their respective directories. Make sure to follow the provided documentation to integrate these tools into your workflow effectively.

## Libraries

The "libs" folder in this repository contains a curated collection of useful libraries that serve as dependencies for various tools and programs within this project. These libraries are essential for the proper functioning of certain functionalities and enhance the overall robustness and efficiency of the tools. Feel free to explore the "libs" directory to familiarize yourself with the included libraries and their purposes. If you're contributing to or modifying any of the tools, make sure to review the documentation and licensing information for each library. Keeping these libraries organized in a separate folder promotes modularity and ensures that the tools can seamlessly access the required resources.

## Contributing

If you have ideas for new tools, improvements to existing ones, or general suggestions, please feel free to contribute! Follow the guidelines in the [CONTRIBUTING.md](./CONTRIBUTORS.md) file to get started.

## License

This project is licensed under the [MIT License](./LICENSE), which means you are free to use, modify, and distribute the tools as long as you include the original license and disclaimer. See the [LICENSE](./LICENSE) file for more details.

---

Happy coding! 🚀
