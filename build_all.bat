@echo off
setlocal

set watch_mode=false
if "%1"=="-w" (
    set watch_mode=true
)

set packages=apps\bswfa_ui

for %%p in (%packages%) do (
    echo Processing %%p...
    cd %%p
    if "%watch_mode%"=="true" (
        echo Running build_runner watch in %%p...
        start cmd /k dart run build_runner watch --delete-conflicting-outputs
    ) else (
        echo Running build_runner build in %%p...
        start cmd /k dart run build_runner build --delete-conflicting-outputs
    )
    cd %~dp0
)

echo Process complete!
endlocal
