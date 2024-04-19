# culture="es-ES"
ConvertFrom-StringData @"
    ToolIntro = Herramienta para la creación automática de scripts de activación remota (Wake On Lan).
    PS2EXEPresent = Módulo PS2EXE presente: se generarán ejecutables (.EXE).
    PS2EXENotFound = Módulo PS2EXE no encontrado: si no está instalado, solo se crearán scripts por lotes (.BAT) en lugar de ejecutables.
    InstallPS2EXE = ¿Instalar el módulo PS2EXE? (y/n)
    PS2EXEInstalled = Módulo PS2EXE instalado correctamente: se generarán ejecutables (.EXE).
    PS2EXEInstallFailed = El módulo PS2EXE no se instaló correctamente: se generarán scripts por lotes (.BAT).
    PCInputPrompt = Nombres de PC o direcciones IP (separados por espacio)
    GeneratingScriptForPC = Generando script de activación remota para PC '{0}'...
    IPAddressFound = Dirección IP encontrada para '{0}': {1}.
    PCIgnored = PC '{0}' ignorado: el PC especificado no existe en la red, está apagado o desconectado.
    PingingIPAddress = Haciendo ping a {0} para ver si está accesible...
    PCConnected = PC '{0}' está conectado y accesible.
    PCNotReachable = ADVERTENCIA: el PC '{0}' no es accesible en la IP '{1}'. Se intentará encontrar la dirección MAC en la caché ARP, en caso de encontrarla, aún podría no estar actualizada y puede que no corresponda a la dirección MAC real.
    LookingUpMACAddress = Buscando la dirección MAC de '{0}'...
    MACAddressNotFound = Dirección MAC no encontrada: se ignorará el PC '{0}'.
    MACAddressFound = Dirección MAC de '{0}' encontrada: {1}
    WakeupScriptGenerated = Script de activación para '{0}' generado correctamente.
    RemoteWakeupFolder = Activación remota WOL
    ScriptFileNamePrefix = Wake
"@
