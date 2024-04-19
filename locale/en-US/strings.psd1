# culture="en-US"
ConvertFrom-StringData @"
    ToolIntro = Tool for automatic creation of remote wake-up scripts (Wake On Lan).
    PS2EXEPresent = PS2EXE module present: executables (.EXE) will be generated.
    PS2EXENotFound = PS2EXE module not found: if not installed, only batch scripts (.BAT) will be created instead of executables.
    InstallPS2EXE = Install PS2EXE module? (y/n)
    PS2EXEInstalled = PS2EXE module installed successfully: executables (.EXE) will be generated.
    PS2EXEInstallFailed = PS2EXE module didn't install properly: batch scripts (.BAT) will be generated.
    PCInputPrompt = PC names or IP addresses (separated by space)
    GeneratingScriptForPC = Generating remote wake-up script for PC '{0}'...
    IPAddressFound = IP address found for '{0}': {1}.
    PCIgnored = PC '{0}' ignored: the specified PC does not exist on the network, is turned off, or is disconnected.
    PingingIPAddress = Pinging {0} to see if it's reachable...
    PCConnected = PC '{0}' is connected and reachable.
    PCNotReachable = WARNING: PC '{0}' is not reachable at IP '{1}'. Will attempt to find the MAC address in the ARP cache, in case found it might still not be up-to-date and may not correspond to the actual MAC address.
    LookingUpMACAddress = Looking up MAC address of '{0}'...
    MACAddressNotFound = MAC address not found: PC '{0}' will be ignored.
    MACAddressFound = MAC address of '{0}' found: {1}
    WakeupScriptGenerated = Wake-up script for '{0}' generated successfully.
    RemoteWakeupFolder = Remote Wakeup WOL
    ScriptFileNamePrefix = Wake
"@
