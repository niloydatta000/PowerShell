# Update Python Packages using `pip` Command

## Analyze Python Packages And Upgrade Them To The Latest Versions



**Detailed Description:**
The `Update-PythonPackages` function automates the process of managing Python packages. It uses `pip` cmdlet to check both the existing and the newest versions of *Python Packages* available to install.
 If they do not match, this function automatically replace the older versions with newer ones each by each.
This function requires no parameters and does everything itself just by calling it thus saves time. 
Here, no need for rot memorization of package names, it will display...

- List of outdated packages.
- Upgrade progress for each package.

This function is suitable for use with any Python environment, including virtual environments. 




**REQUIREMENTS:**
The `Update-PythonPackages` function uses `pip` cmdlet to check and upgrade outdated packages. So `pip` should be updated first (Not necessary but recommended). 
To do this first the following command must be run.

```PowerShell
python -m pip install --upgrade pip
```


Additional Requirements:

- PowerShell 5.0 or higher.
- Pip is installed and accessible via `pip` command.
- Python installed and accessible to PATH environment variables.
- Ensure `python` & `pip` are installed and accessible from the PATH environment variable.
- For virtual environments, activate the environment before running the function to ensure correct package upgrades.



**SUMMARY:**
Manually checking & upgrading packages by typing each package names is time consuming for python programmers. Here is the easiest way to automate this task using PowerShell terminal.
