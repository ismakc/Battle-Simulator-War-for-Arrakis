# Forzar codificación UTF-8 para mostrar caracteres correctamente
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

# Establecer la ruta de trabajo a la ubicación actual del script
$projectRoot = Get-Location

# Definir las rutas relativas
$pubspecPath = Join-Path $projectRoot "apps\bswfa_ui\pubspec.yaml"
$corePackagePath = Join-Path $projectRoot "packages\bswfa_core"
$buildPath = Join-Path $projectRoot "apps\bswfa_ui\build\app\outputs\bundle\release"
$nativeLibsPath = Join-Path $projectRoot "apps\bswfa_ui\build\app\intermediates\merged_native_libs\release\mergeReleaseNativeLibs\out\lib"
$zipOutput = Join-Path $projectRoot "build\debug_native_symbols.zip"
$buildDir = Join-Path $projectRoot "build"

# Eliminar y crear el directorio build
if (Test-Path $buildDir) {
    try {
    Remove-Item -Recurse -Force $buildDir
    } catch {
        Write-Host "No se pudo eliminar la carpeta build. Puede estar en uso. Intenta cerrar programas que la estén usando."
    }
}
New-Item -ItemType Directory -Path $buildDir | Out-Null

# Leer la versión actual del archivo pubspec.yaml
$currentVersion = (Select-String -Path $pubspecPath -Pattern "^version: ").Line.Split()[1]

# Solicitar la nueva versión
$newVersion = Read-Host "Introduce la nueva versión"

# Actualizar el archivo pubspec.yaml con la nueva versión
(Get-Content $pubspecPath) | ForEach-Object {
    if ($_ -match "^version: ") {
        "version: $newVersion"
    } else {
        $_
    }
} | Set-Content $pubspecPath

# Compilar el paquete Dart ubicado en packages/bswfa_core
cd $corePackagePath
dart pub get
dart run build_runner build --delete-conflicting-outputs

# Continuar con el proceso de construcción de la aplicación
cd (Join-Path $projectRoot "apps\bswfa_ui")
flutter clean
dart run build_runner build --delete-conflicting-outputs
flutter build appbundle

# Verificar si el archivo .aab se ha creado correctamente
if (Test-Path "$buildPath\app-release.aab") {
    Copy-Item -Path "$buildPath\app-release.aab" -Destination "$buildDir\app-release.aab"
    Write-Host "Archivo .aab copiado a $buildDir"
} else {
    Write-Host "Error: No se encontró el archivo app-release.aab en $buildPath"
    exit 1
}

# Verificar si existen directorios de librerías nativas
$arm64Path = Join-Path $nativeLibsPath "arm64-v8a"
$armeabiPath = Join-Path $nativeLibsPath "armeabi-v7a"
$x86Path = Join-Path $nativeLibsPath "x86_64"

if ((Test-Path $arm64Path) -and (Test-Path $armeabiPath) -and (Test-Path $x86Path)) {
    Compress-Archive -Path $arm64Path, $armeabiPath, $x86Path -DestinationPath $zipOutput
} else {
    Write-Host "Error: No se encontraron uno o más directorios necesarios en $nativeLibsPath"
    exit 1
}
