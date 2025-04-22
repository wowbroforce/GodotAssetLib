@echo off
setlocal enabledelayedexpansion

REM === Prepare release folder ===
if exist ".release" (
    echo Cleaning release folder...
    del /q /f .release\*
) else (
    mkdir .release
)

REM === Loop through each subfolder ===
for /d %%F in (*) do (
    set "folder=%%F"
    set "version="

    REM Skip the release folder itself
    if /i not "%%F"==".release" (

        REM Check for plugin.cfg
        if exist "%%F\plugin.cfg" (
            REM Extract version from plugin.cfg
            for /f "tokens=1,* delims==" %%A in ('findstr /b "version=" "%%F\plugin.cfg"') do (
                set "raw_version=%%B"
                set "version=!raw_version:"=!"
            )
        )

        REM Default version if not found
        if not defined version (
            set "version=0.0"
        )

        REM Set ZIP output path
        set "zip_path=.release\!folder!_v!version!.zip"

        echo Zipping !folder! to !zip_path!
        powershell -Command "Compress-Archive -Path '!folder!\*' -DestinationPath '!zip_path!' -Force"
    )
)

echo All done! Zips are in the release folder.
pause
