# culture="fr-FR"
ConvertFrom-StringData @"
    ToolIntro = Outil de création automatique de scripts de réveil à distance (Wake On Lan).
    PS2EXEPresent = Module PS2EXE présent : des exécutables (.EXE) seront générés.
    PS2EXENotFound = Module PS2EXE non trouvé : s'il n'est pas installé, seuls des scripts par lot (.BAT) seront créés au lieu des exécutables.
    InstallPS2EXE = Installer le module PS2EXE ? (y/n)
    PS2EXEInstalled = Module PS2EXE installé avec succès : des exécutables (.EXE) seront générés.
    PS2EXEInstallFailed = Le module PS2EXE n'a pas été installé correctement : des scripts par lot (.BAT) seront générés.
    PCInputPrompt = Noms de PC ou adresses IP (séparés par un espace)
    GeneratingScriptForPC = Génération du script de réveil à distance pour le PC '{0}'...
    IPAddressFound = Adresse IP trouvée pour '{0}' : {1}.
    PCIgnored = PC '{0}' ignoré : le PC spécifié n'existe pas sur le réseau, est éteint ou déconnecté.
    PingingIPAddress = Ping de {0} pour voir s'il est accessible...
    PCConnected = PC '{0}' est connecté et accessible.
    PCNotReachable = AVERTISSEMENT : le PC '{0}' n'est pas accessible à l'adresse IP '{1}'. Une tentative sera faite pour trouver l'adresse MAC dans le cache ARP, au cas où elle serait trouvée, elle pourrait ne pas être à jour et ne pas correspondre à l'adresse MAC réelle.
    LookingUpMACAddress = Recherche de l'adresse MAC de '{0}'...
    MACAddressNotFound = Adresse MAC non trouvée : le PC '{0}' sera ignoré.
    MACAddressFound = Adresse MAC de '{0}' trouvée : {1}
    WakeupScriptGenerated = Script de réveil pour '{0}' généré avec succès.
    RemoteWakeupFolder = Réveil à distance WOL
    ScriptFileNamePrefix = Wake
"@
