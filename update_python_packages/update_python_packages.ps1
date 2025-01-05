function Update-PythonPackages {
    <#
    .SYNOPSIS
    Updates all outdated Python packages to their latest versions.

    .DESCRIPTION
    The `Update-PythonPackages` function automates the process of managing Python packages. It:
    1. Identifies outdated Python packages using `pip list --outdated`.
    2. Iterates through the list of outdated packages and upgrades each to its latest version.

    This function is suitable for use with any Python environment, including virtual environments. 

    .PARAMETER None
    This function does not require any parameters. It operates on the default Python environment or the currently activated virtual environment.

    .OUTPUTS
    Displays a log of actions, including:
    - List of outdated packages.
    - Upgrade progress for each package.

    .EXAMPLE
    PS C:\> Update-PythonPackages

    This command upgrades all Python packages in the default Python installation.

    .NOTES
    - Ensure Python & pip are installed and accessible from the PATH environment variable.
    - For virtual environments, activate the environment before running the function to ensure correct package upgrades.

    .REQUIREMENTS
    - PowerShell 5.0 or higher.
    - Pip is installed and accessible via `pip` command.
    - Python installed and accessible to PATH.

    #>
     
    


    # Check if pip is installed and accessible:
    $pipPath = (Get-Command pip).Source
    if (-not $pipPath) {
        Write-Error "pip is not installed properly or not found in the PATH."
        return
    }

    

    # Get the list of outdated packages:
    $outdatedPackages = & $pipPath list --outdated --format=json | ConvertFrom-Json

    if ($outdatedPackages.Count -eq 0) {
        Write-Host "All Python packages are up to date."
        return
    }

    Write-Host "The following packages are outdated:"
    $outdatedPackages | ForEach-Object { Write-Host "$($_.name): $($_.version) -> $($_.latest_version)" }

    # Upgrade each outdated package:
    foreach ($package in $outdatedPackages) {
        Write-Host "Upgrading $($package.name)..."
        & $pipPath install --upgrade $package.name
    }

    Write-Host "All outdated packages have been upgraded."

}




# Display help information for the function:
Get-Help Update-PythonPackages
