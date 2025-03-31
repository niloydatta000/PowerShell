# App Uninstaller PowerShell Script

## Overview
This PowerShell script is designed to detect and remove potentially unwanted executable applications (.exe) from a system. It acts as a simple antivirus-like tool, helping users eliminate non-standard applications that could pose security risks.

## Features
- Identifies installed `.exe` applications.
- Provides an option to uninstall or remove suspicious applications.
- Enhances system security by reducing potential attack vectors.

## Prerequisites
- Windows PowerShell (version 5.1 or later recommended)
- Administrator privileges (required for uninstalling applications)

## Usage
1. **Download the script**: Save `exeapps\app_uninstaller.ps1` file to a known location.
2. **Open PowerShell as Administrator**.
3. **Run the script** by executing:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force
   .\exeapps\app_uninstaller.ps1
   ```
4. Follow the on-screen instructions to review and remove unwanted applications.

## Security Considerations
- It does not detect risky apps rather show all installed apps. Be cautious when removing applications; some `.exe` files are essential for system functionality.
- Ensure that the script is obtained from a trusted source to prevent tampering.
- Always verify the applications listed before uninstallation.

## Disclaimer
This script is provided as-is with no warranties. Use at your own risk. The author is not responsible for any unintended consequences arising from its use. This script needs manipulation to execute correctly. By default `$unknownApps` is an empty array. You have to put manually app names to the array that you want to uninstall.
