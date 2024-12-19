# PowerShell Function to convert one file type to another

# Convert-FileType

A PowerShell function to convert files from one type to another in a specified directory.

## Description

The `Convert-FileType` function takes a directory path, a source file type, and a target file type as input parameters. It identifies all files of the specified source type in the directory and converts them to the target type by renaming the file extensions. If a file with the target name already exists, the function skips the conversion and displays a message.

---

## Parameters

### Path
- **Description**: The directory path where the files are located. If not specified, it defaults to the current directory. This can be delivered from Pipeline too.
- **Type**: String
- **Default Value**: Current directory
- **Optional**

### FromType
- **Description**: The source file type to convert (e.g., `.jpg`).
- **Type**: String
- **Mandatory**

### ToType
- **Description**: The target file type to convert to (e.g., `.png`).
- **Type**: String
- **Mandatory**

---

## Examples

### Example 1: Convert `.jpg` files to `.png` in the current directory
```powershell
Convert-FileType -FromType .jpg -ToType .png
