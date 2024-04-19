# Wake-on-Lan PowerShell Scripts Creator

## Overview
This PowerShell script allows you to generate Wake-On-LAN (WOL) scripts or executables for waking up single computers remotely. Instead of directly sending magic packets, it creates scripts or executables that, when run, automatically send the magic packets to wake up the specified computers on the network.

This might come in handy if you need to give the ability to inexperienced Windows users to wake up remotely a host supporting WOL. Simply put on their Desktop the generated script (or executable) and the user will be able to send a magic packet to a specific host by simply double-clicking on it.

## Download
If you're not willing to modify or compile your own executable, you can download the latest release from the [releases section here](https://github.com/imwaffe/WOLScriptsCreator/releases/latest).

## Prerequisites
- PowerShell 5.1 or higher (for the creation of the wake scripts)
- PowerShell 3.0 or higher (for the execution of the generated scripts)
- PS2EXE module (optional, for creating executables)

## Usage
1. Clone or download the repository.
2. Run the script in a PowerShell environment or the Exe (see the [Make section](##-Make.ps1:-Compile-the-executable-for-the-WOL-Scripts-Creator) or download the Exe from the [releases](https://github.com/imwaffe/WOLScriptsCreator/releases/latest).)
3. Follow the prompts to input the target PC names or IP addresses.
4. The script will generate scripts or executables for waking up a single specified computer in a folder inside the path where the executable is run from.

## PS2EXE support
If PS2EXE is installed in your system, the script automatically creates executables, otherwise it creates .bat files that will execute a powershell code to send the magic packet. The choice to create .bat files has been made in order to create a file that can be run by simply double clicking on it.

## Localization
The script is run with the same locale as the system locale, defaulting to en-US. Feel free to edit, add or remove localizations from the [locale/](locale) directory (at least `en-US` needs to be present).

The generated scripts for the english version are stored in a directory called [Remote Wakeup WOL]() in the path from where the script is launched. For other location and script names please refer to the `RemoteWakeupFolder` and `ScriptFileNamePrefix` keys in the [strings.psd1](locale/en-US/strings.psd1) files inside the localization directories.

## Example
The script doesn't accept arguments, but provides a prompt, simply run it from a PowerShell environment or run the EXE that can be found in the releases.
```
.\wake-on-lan.ps1

Tool for automatic creation of remote wake-up scripts (Wake On Lan).
Copyright (C) Luca Armellin 2024
GitHub: https://github.com/imwaffe
https://www.armellinluca.com
GitHub/Twitter/Instagram: @imwaffe


PS2EXE module present: executables (.EXE) will be generated.


PC names or IP addresses (separated by space): ALICE-PC NON-EXISTING-PC

Generating remote wake-up script for PC 'ALICE-PC'...
IP address found for 'ALICE-PC': 192.168.1.10.
Pinging 192.168.1.10 to see if it's reachable...
PC 'ALICE-PC' is connected and reachable.
Looking up MAC address of 'ALICE-PC'...
MAC address of 'ALICE-PC' found: 00AABBCCDDEE
Wake-up script for 'ALICE-PC' generated successfully.


Generating remote wake-up script for PC 'NON-EXISTING-PC'...
PC 'NON-EXISTING-PC' ignored: the specified PC does not exist on the network, is turned off, or is disconnected.
```

After this a directory in the same path where the script is executed will be generated (which name depends on the locale) containing the scripts (or the executables if PS2EXE is installed) for each host:
```
...\Remote Wakeup WOL> dir


    Directory: ...\Remote Wakeup WOL


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        19/04/2024     10:35          25600 Wake ALICE-PC.exe
-a----        19/04/2024     10:35          25600 Wake BOB-PC.exe
```

Running the file `Wake BOB-PC.exe` will automatically send a magic packet to wake `BOB-PC`.

## Make.ps1: Compile the executable for the WOL Scripts Creator
The WOL Scripts Creator makes use of the Import-LocalizedData cmdlet to import localized strings from the [locale/](locale) directory, but PS2EXE allows only a single PS1 file as input.

To overcome this limit, I wrote a simple [Make.PS1](Make.ps1) script that takes all the PSD1 localization files in [locale/](locale), the main [WOLScriptsCreator.ps1](WOLScriptsCreator.ps1) and combine them in a single PS1 file that is then used to generate an executable which will be saved in the [bin/](bin) folder. You can use that to customize the WOL Scripts Creator and generate the exe afterward.

# License
This script is distributed under the MIT License. See the [LICENSE](LICENSE.MD) file for details.