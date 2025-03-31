$exeAppList1 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"
$exeAppList2 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
$exeAppList3 = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"
$exeAppList4 = "HKCU:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"

# Get all installed applications from the registry:
Get-ItemProperty -Path $exeAppList1, $exeAppList2, $exeAppList3, $exeAppList4 | 
    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName |
    Format-Table -AutoSize

$installedApps = Get-ItemProperty -Path $exeAppList1, $exeAppList2, $exeAppList3, $exeAppList4 | 
    Select-Object DisplayName, UninstallString

$unknownApps = @() # Apps that are to be uninstalled (just modify this list)

if (!$unknownApps) {
    Write-Host "No unknown apps to uninstall."
} 
else {
    foreach ($app in $unknownApps) {
        $appToUninstall = $installedApps | Where-Object { $_.DisplayName -like "*$app*" }
        if ($appToUninstall) {
            $response = Read-Host "[?]Do you want to uninstall $($appToUninstall.DisplayName)? (Y/N): "
            if ($response -match "^Y" -or $response -match "^y") {
                Write-Host "Uninstalling $($appToUninstall.DisplayName)..."
                Start-Process -FilePath $appToUninstall.UninstallString -ArgumentList "/S" -Wait
                Write-Host "$($appToUninstall.DisplayName) uninstalled successfully."
            } else {
                Write-Host "Skipping uninstallation of $($appToUninstall.DisplayName)."
            }
        } else {
            Write-Host "Application $app not found."
        }
    }
}