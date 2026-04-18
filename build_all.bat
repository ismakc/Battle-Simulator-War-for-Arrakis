@echo off
:: build_all.bat — Automatiza la generación de código Freezed para los paquetes Dart del monorepo bswfa.
:: Ejecuta build_runner en orden: primero bswfa_core, luego bswfa_ui (el segundo depende del primero).
:: Uso:
::   build_all.bat        — Genera el código una vez en ambos paquetes.
::   build_all.bat -w     — Inicia el generador en modo observación (watch) en ambos paquetes.
:: Notas:
::   - Ejecutar tras modificar cualquier clase anotada con @freezed.
::   - Cada build se ejecuta en una ventana cmd separada para observar la salida.
setlocal

:: Determina si se activa el modo watch
set watch_mode=false
if "%1"=="-w" (
    set watch_mode=true
)

:: Define los paquetes a procesar (orden: core primero)
set packages=packages\bswfa_core apps\bswfa_ui

for %%p in (%packages%) do (
    echo Processing %%p...
    cd /d "%~dp0%%p"
    if "%watch_mode%"=="true" (
        echo Running build_runner watch in %%p...
        dart run build_runner watch --delete-conflicting-outputs
    ) else (
        echo Running build_runner build in %%p...
        dart run build_runner build --delete-conflicting-outputs
    )
    cd /d "%~dp0"
)

echo Process complete!
endlocal
