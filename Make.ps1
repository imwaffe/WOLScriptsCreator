# Copyright (C) Luca Armellin 2024 - Distributed under MIT License
# github.com/imwaffe @imwaffe

# This tool uses PS2EXE to generate an EXE file from 'WOL Launcher Creator.ps1' script,
# after embedding the localized strings in .\locale\ in a single file.

Write-Host "Make Wake-on-Lan Scripts Creator - Copyright (C) Luca Armellin 2024
GitHub: https://github.com/imwaffe
https://www.armellinluca.com
GitHub/Twitter/Instagram: @imwaffe`n`n" -ForegroundColor DarkGray

# Paths and filenames
$localePath = ".\locale"
$localeFilename = "strings.psd1"
$mainScriptFile = '.\WOLScriptsCreator.ps1'
$executableFile = '.\bin\WOLScriptsCreator.exe'
$tmpPsScript = "tmpLocalizedScript.ps1"
$defaultLocale = "en-US"

# Check for PS2EXE module presence
if (Get-Module -ListAvailable -Name PS2EXE) {
    Write-Host "PS2EXE module is installed." -ForegroundColor DarkGreen
} 
else {
    Write-Host "PS2EXE module not found, it's needed in order to generate an executable." -ForegroundColor DarkCyan
    $install = Read-Host -Prompt "Install PS2EXE module? (y/n)"
    if($install -eq 'y'){
        Start-Process -FilePath powershell.exe -Wait -ArgumentList {Install-Module PS2EXE -Confirm:$False -Force} -Verb RunAs
    } else {
        Write-Host "PS2EXE not installed: aborting." -ForegroundColor DarkRed
    }
    if (Get-Module -ListAvailable -Name PS2EXE){
        Write-Host "PS2EXE module installed successfully." -ForegroundColor DarkGreen
    } else {
        Write-Host "PS2EXE module not installed properly: aborting." -ForegroundColor DarkRed
        Pause
        Exit
    }
}
echo "`n"


# Get available localizations from $localePath
$locales = Get-ChildItem -Path $localePath -Directory

# Store the localization strings in hastables inside another hashtable having the locale string for key
$localeArray = @{}

Write-Host "Looking for locales in '$localePath'..." -ForegroundColor DarkCyan
# Loop each locale
foreach ($locale in $locales) {
    Write-Host "`t directory '$($locale.Name)' found" -ForegroundColor DarkCyan -NoNewLine
    # Get each psd1 file
    $psd1FilePath = Join-Path -Path $locale.FullName -ChildPath "$localeFilename"
    if (Test-Path $psd1FilePath) {
        Write-Host  ": localeappended succesfully." -ForegroundColor DarkGreen
        # Get the PSD1 content and append it to $localeArray
        $content = Get-Content $psd1FilePath -Raw
        $localeArray[$locale.Name] = $content
    } else {
        Write-Host ": locale file cannot be read or found, skipped." -ForegroundColor DarkRed
    }
}


# Build the the self contained ps1 file content
# Insert the locale hashtable to the top of the new script.
$selfContainedScriptContent = '$locale = @{' + [Environment]::NewLine
foreach ($locale in $localeArray.Keys) {
    $selfContainedScriptContent += "`t`"$locale`" = "
    $selfContainedScriptContent += $localeArray[$locale]
    $selfContainedScriptContent += [Environment]::NewLine
}
$selfContainedScriptContent += '}'

# Add a function to load into $localizedStrings only the localized strings corresponding
# to the WinSystemLocale, defaulting to $defaultLocale
$selfContainedScriptContent += '
$localeName=if($locale.Keys -contains (Get-WinSystemLocale).Name){(Get-WinSystemLocale).Name} else {"'+$defaultLocale+'"}
$localizedStrings = $locale[$localeName]
'

Write-Host "`nLoading main script file '$mainScriptFile'..." -ForegroundColor DarkCyan
# Append the content of the main script file
$selfContainedScriptContent += Get-Content $mainScriptFile -Raw

Write-Host "Writing new script to temporary position..." -ForegroundColor DarkCyan
# Save the new script to a temporary ps1 file
$selfContainedScriptContent | Out-File -FilePath "$localePath\$tmpPsScript"

Write-Host "Deleting former localization from new script..." -ForegroundColor DarkCyan
# Remove the row containing the Import-LocalizedData cmdlet since it's of no use anymore,
# having included the localized strings in the script itself
Set-Content -Path "$localePath\$tmpPsScript" -Value (get-content -Path "$localePath\$tmpPsScript" | Select-String -Pattern 'Import-LocalizedData' -NotMatch)

Write-Host "`nGenerating executable with PS2EXE module..." -ForegroundColor DarkCyan
# Build the EXE from the temporary ps1 file
Invoke-ps2exe -inputFile "$localePath\$tmpPsScript" -outputFile $executableFile

Write-Host "`nDelete temporary script." -ForegroundColor DarkCyan
# Delete the temporary ps1 file
Remove-Item "$localePath\$tmpPsScript"

Pause