@echo off
setlocal enabledelayedexpansion

:: 1. Compilar el APK en modo release
echo ===============================
echo Compilando APK en modo release...
echo ===============================
flutter build apk --release
if %errorlevel% neq 0 (
    echo ❌ Error al compilar el APK.
    pause
    exit /b %errorlevel%
)

:: 2. Crear carpeta apk si no existe
if not exist apk (
    mkdir apk
)

:: 3. Copiar el APK generado
set APK_SOURCE=build\app\outputs\flutter-apk\app-release.apk
set APK_DEST=apk\app-release.apk
if exist "!APK_SOURCE!" (
    copy /Y "!APK_SOURCE!" "!APK_DEST!"
    echo ✅ APK copiado en !APK_DEST!
) else (
    echo ❌ No se encontró el APK generado en !APK_SOURCE!
    pause
    exit /b 1
)

:: 4. Verificar si hay cambios en Git
echo ===============================
echo Verificando cambios en Git...
echo ===============================
git status --porcelain > temp_git_changes.txt
set /a changeCount=0
for /f %%i in ('find /v /c "" ^< temp_git_changes.txt') do set changeCount=%%i
del temp_git_changes.txt

if %changeCount% gtr 0 (
    echo ✅ Cambios detectados. Realizando commit...
    git add .

    :: Pedir mensaje de commit
    set /p commit_message=Introduce mensaje del commit: 

    git commit -m "!commit_message!"
    git push

    echo ✅ Cambios comiteados y enviados a GitHub.
) else (
    echo ⚠️  No hay cambios para comitear. Nada que subir.
)

pause
