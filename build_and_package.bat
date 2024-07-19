@echo off
cd C:\Users\ismae\dvl\bswfa
call flutter clean
call dart run build_runner build --delete-conflicting-outputs
call flutter build appbundle
copy build\app\outputs\bundle\release\app-release.aab build\app-release.aab
cd build\app\intermediates\merged_native_libs\release\out\lib
"C:\Program Files\7-Zip\7z.exe" a -tzip C:\Users\ismae\dvl\bswfa\build\debug_native_symbols.zip arm64-v8a armeabi-v7a x86_64