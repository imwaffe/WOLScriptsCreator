# culture="it-IT"
ConvertFrom-StringData @"
    ToolIntro = Strumento per la creazione automatica di script di attivazione remota (Wake On Lan).
    PS2EXEPresent = Modulo PS2EXE presente: verranno generati eseguibili (.EXE).
    PS2EXENotFound = Modulo PS2EXE non trovato: se non installato, verranno creati solo script batch (.BAT) invece di eseguibili.
    InstallPS2EXE = Installare il modulo PS2EXE? (y/n)
    PS2EXEInstalled = Modulo PS2EXE installato con successo: verranno generati eseguibili (.EXE).
    PS2EXEInstallFailed = Modulo PS2EXE non installato correttamente: verranno creati solo script batch (.BAT).
    PCInputPrompt = Nomi PC o indirizzi IP (separati da spazio)
    GeneratingScriptForPC = Generazione dello script di attivazione remota per il PC '{0}'...
    IPAddressFound = Indirizzo IP trovato per '{0}': {1}.
    PCIgnored = PC '{0}' ignorato: il PC specificato non esiste nella rete, è spento o è disconnesso.
    PingingIPAddress = Ping di {0} per verificare se è raggiungibile...
    PCConnected = PC '{0}' è connesso e raggiungibile.
    PCNotReachable = ATTENZIONE: il PC '{0}' non è raggiungibile all'IP '{1}'. Si cercherà di trovare l'indirizzo MAC nella cache ARP, nel caso in cui venga trovato potrebbe comunque non essere aggiornato e non corrispondere all'indirizzo MAC effettivo.
    LookingUpMACAddress = Ricerca dell'indirizzo MAC di '{0}'...
    MACAddressNotFound = Indirizzo MAC non trovato: il PC '{0}' verrà ignorato.
    MACAddressFound = Indirizzo MAC di '{0}' trovato: {1}
    WakeupScriptGenerated = Script di attivazione remota per '{0}' generato con successo.
    RemoteWakeupFolder = Accensione Remota WOL
    ScriptFileNamePrefix = Risveglia
"@
