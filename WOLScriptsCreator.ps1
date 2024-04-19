# Copyright (C) Luca Armellin 2024 - Distributed under MIT License
# github.com/imwaffe @imwaffe

# Load localized strings
$localizedStrings = Import-LocalizedData -BaseDirectory ./locale -FileName 'strings.psd1'

# Introduction
Write-Host $localizedStrings.ToolIntro -ForegroundColor DarkGray
Write-Host "Wake-on-Lan Scripts Creator - Copyright (C) Luca Armellin 2024
GitHub: https://github.com/imwaffe
https://www.armellinluca.com
GitHub/Twitter/Instagram: @imwaffe`n`n" -ForegroundColor DarkGray

# Check for PS2EXE module presence
if (Get-Module -ListAvailable -Name PS2EXE) {
    Write-Host $localizedStrings.PS2EXEPresent -ForegroundColor DarkCyan
    $exeCapable = $true
} 
else {
    Write-Host $localizedStrings.PS2EXENotFound -ForegroundColor DarkCyan
    $install = Read-Host -Prompt $localizedStrings.InstallPS2EXE
    if($install -eq 'y'){
        Start-Process -FilePath powershell.exe -Wait -ArgumentList {Install-Module PS2EXE -Confirm:$False -Force} -Verb RunAs
    }
    if (Get-Module -ListAvailable -Name PS2EXE){
        Write-Host $localizedStrings.PS2EXEInstalled -ForegroundColor DarkCyan
        $exeCapable = $true
    } else {
        Write-Host $localizedStrings.PS2EXEInstallFailed -ForegroundColor DarkCyan
        $exeCapable = $false
    }
}
echo "`n"

# Input for PC names or IP addresses
$targetstring = Read-Host $localizedStrings.PCInputPrompt
$targets = $targetstring.Split(',').Split(';').Split(' ');

foreach($device in $targets){
    echo ""
    # Generating script for each PC
    Write-Host ($localizedStrings.GeneratingScriptForPC -f $device) -ForegroundColor Black -BackgroundColor White
    $hostNameExists = $false
    $ip = $false
    if ( $device | ? { $_ -match "[0-9].[0-9].[0-9].[0-9]" } ){
        # If $device contains an IP address
        $ip = $device
        $hostNameExists = $true
    }
    else {
        # If $device contains a host name
        try{
            # Try to get IP address from host name
            $ip = [System.Net.Dns]::GetHostByName($device).AddressList[0].IpAddressToString
            Write-Host ($localizedStrings.IPAddressFound -f $device, $ip) -ForegroundColor Gray
            $hostNameExists = $true
        } catch {
            # If host name cannot be resolved
            Write-Host ($localizedStrings.PCIgnored -f $device) -ForegroundColor White -BackgroundColor DarkRed
            $hostNameExists = $false
        }
    }
    $deviceExists = $false;
    if($hostNameExists){
        # Ping the IP address to check connectivity
        Write-Host ($localizedStrings.PingingIPAddress -f $ip) -ForegroundColor DarkGray
        $ping = ( new-object System.Net.NetworkInformation.Ping ).Send($ip)
        if($ping.Status -eq "Success"){
            # If ping is successful
            Write-Host ($localizedStrings.PCConnected -f $device) -ForegroundColor Gray
        } else {
            # If ping fails
            Write-Host ($localizedStrings.PCNotReachable -f $device, $ip) -ForegroundColor Black -BackgroundColor DarkYellow
        }
        # Look up MAC address in ARP cache
        Write-Host ($localizedStrings.LookingUpMACAddress -f $device) -ForegroundColor DarkGray
        $matches = $false
        ( arp -a $ip | ? { $_ -match $ip } ) -match "([0-9A-F]{2}([:-][0-9A-F]{2}){5})" | out-null
        if (!$matches ){
            # If MAC address not found
            Write-Host ($localizedStrings.MACAddressNotFound -f $device) -ForegroundColor White -BackgroundColor DarkRed
        } else {
            $deviceExists = $true
        }
    }

    if($deviceExists -and $hostNameExists){
        $mac = $matches[0].Replace('-','').ToUpper()
        Write-Host ($localizedStrings.MACAddressFound -f $device, $mac) -ForegroundColor Gray
        # Create directory for Wake On LAN scripts
        New-Item -ItemType Directory -Force -Path ".\$($localizedStrings.RemoteWakeupFolder)\" | out-null
        # Create the powershell command to build and broadcast the magic packet for the specific MAC address
        $command = "`$Packet=[Byte[]](,0xFF*6)+(([Net.NetworkInformation.PhysicalAddress]::Parse('$mac').GetAddressBytes()*16));`$UDPClient = New-Object Net.Sockets.UdpClient; `$UDPClient.Send(`$Packet, `$Packet.Length, (New-Object Net.IPEndPoint (([System.Net.IPAddress]::Broadcast)), 9)); `$UDPClient.Close();"
        if($exeCapable){
            # If PS2EXE module is present, create executable
            $command | Out-File -Encoding ASCII (New-Item -Path ".\wol_tmp_script.ps1" -Force)
            Invoke-ps2exe -inputFile ".\wol_tmp_script.ps1" -outputFile ".\$($localizedStrings.RemoteWakeupFolder)\$($localizedStrings.ScriptFileNamePrefix) $device.exe" -x86 | out-null
            Remove-Item ".\wol_tmp_script.ps1" | out-null
        } else {
            # If PS2EXE module is not present, create batch file
            "powershell.exe -command `"$command`"" | Out-File -Encoding ASCII (New-Item -Name "$($localizedStrings.ScriptFileNamePrefix) $device.bat" -Path ".\$($localizedStrings.RemoteWakeupFolder)" -Force)
        }
        # Display success message
        Write-Host ($localizedStrings.WakeupScriptGenerated -f $device) -ForegroundColor White -BackgroundColor DarkGreen
    }
    echo "`n`n"
}
Pause