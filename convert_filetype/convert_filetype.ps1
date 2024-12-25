
function Convert-FileType {
    <#
    .SYNOPSIS
    Change File type from one to another
    .DESCRIPTION
    This function will takes Path, FromType, ToType as input and convert file type from FromType to ToType files
    .PARAMETER Path
    This parameter is set by-default the current working directory.
Support ValueFromPipeline = True
    .PARAMETER FromType
    This is a mandatory parameter which takes target file extension to be converted
    .PARAMETER ToType
    This is a mandatory parameter which takes file extension of which target type to convert
    .EXAMPLE
    Change-FileType -FromType .jpg -ToType .png
    #>
    param (
        [Parameter(ValueFromPipeline)]
        [string]$Path = (Get-Location).Path,
        [Parameter(Mandatory = $true)]
        [string]$FromType,
        [Parameter(Mandatory = $true)]
        [string]$ToType
    )

    Get-ChildItem -Path $Path -Filter "*$FromType" | ForEach-Object {

        $newName = $_.BaseName + $ToType

        # Check if a ToType file with the same name already exists:
        if (-not (Test-Path $newName)) {
            Rename-Item -Path $_.FullName -NewName $newName
            Write-Host "Converted: $($_.Name) to $newName" -ForegroundColor Green
        } else {
            Write-Host "Skipped: $($_.Name) - $newName already exists" -ForegroundColor Red

        }
    }
}


# Get Help for the function:
Get-Help Convert-FileType -Full



