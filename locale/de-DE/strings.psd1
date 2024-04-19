# culture="de-DE"
ConvertFrom-StringData @"
    ToolIntro = Tool zur automatischen Erstellung von Remote-Aufweckskripten (Wake On Lan).
    PS2EXEPresent = PS2EXE-Modul vorhanden: Ausführbare Dateien (.EXE) werden generiert.
    PS2EXENotFound = PS2EXE-Modul nicht gefunden: Wenn nicht installiert, werden nur Batch-Skripte (.BAT) anstelle von ausführbaren Dateien erstellt.
    InstallPS2EXE = PS2EXE-Modul installieren? (y/n)
    PS2EXEInstalled = PS2EXE-Modul erfolgreich installiert: Ausführbare Dateien (.EXE) werden generiert.
    PS2EXEInstallFailed = PS2EXE-Modul nicht ordnungsgemäß installiert: Es werden Batch-Skripte (.BAT) generiert.
    PCInputPrompt = PC-Namen oder IP-Adressen (getrennt durch Leerzeichen)
    GeneratingScriptForPC = Generieren eines Remote-Aufweckskripts für PC '{0}'...
    IPAddressFound = IP-Adresse gefunden für '{0}': {1}.
    PCIgnored = PC '{0}' ignoriert: Der angegebene PC existiert nicht im Netzwerk, ist ausgeschaltet oder getrennt.
    PingingIPAddress = Ping von {0} um zu sehen, ob es erreichbar ist...
    PCConnected = PC '{0}' ist verbunden und erreichbar.
    PCNotReachable = WARNUNG: PC '{0}' ist unter IP '{1}' nicht erreichbar. Es wird versucht, die MAC-Adresse im ARP-Cache zu finden. Falls gefunden, könnte sie dennoch nicht aktuell sein und der tatsächlichen MAC-Adresse nicht entsprechen.
    LookingUpMACAddress = Suchen der MAC-Adresse von '{0}'...
    MACAddressNotFound = MAC-Adresse nicht gefunden: PC '{0}' wird ignoriert.
    MACAddressFound = MAC-Adresse von '{0}' gefunden: {1}
    WakeupScriptGenerated = Aufweckskript für '{0}' erfolgreich generiert.
    RemoteWakeupFolder = Remote-Aufwecken WOL
    ScriptFileNamePrefix = Wake
"@
