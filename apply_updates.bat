@echo off
echo.
echo Apply Updates ~VMAN-Retro-Bliss_LevelUP! 1.0 ~ 
echo Terminating running Retrobat processes...
echo.
TASKKILL /F /IM retrobat.exe /IM emulationstation.exe /IM retroarch.exe 2>nul
DEL /F /Q %TEMP%\vman_update.tmp 2>nul
pushd V:\_tools
for /f "skip=3 eol=: delims=" %%F in ('dir /b /o-d vman-update-*.log') do @del "%%F" 2>nul
popd
echo Welcome to Virtualman Post-Fixes and Optimization Menu, By VMAN!
echo This script will update and optimize common Retrobat files to any other associated files for VMAN's build.
echo IMPORTANT! - RetroBat/Emulationstation will close automatically during the update process.
echo.
echo Refer to VMAN's github repo for all changes at https://github.com/virtual-man007/vman-retrobat
echo You also have option to run from cli v:\_tools\vman_rbl_updater.bat.
echo.
echo IMPORTANT! - Backup all your config files manually, however script will create backup of any existing files with extension of *.VM
echo.
echo Press any key to continue to start the update process - be patient . . .
pause >nul

powershell -Command "$ErrorActionPreference= 'silentlycontinue' ; (Get-Content 'V:\_tools\vman-retrobat-master\updates.txt') -notlike '#*' | ConvertFrom-Csv -Delimiter '|' | ForEach-Object {ForEach ($file in (Get-ChildItem -Path "$($_.Files)" -exclude *.VM)){Remove-Item -ErrorAction SilentlyContinue -Path $($file.fullname + '.VM');Copy-Item -Path $($file.fullname) -Destination $($file.fullname + '.VM');$filecontent = Get-Content -path $file ; if ($($_.LineNr)) {$filecontent[$($_.LineNr)] = $filecontent[$($_.LineNr)] -creplace $($_.SearchTxt),$($_.ReplaceTxt)} else {$filecontent = $filecontent -creplace $($_.SearchTxt),$($_.ReplaceTxt)} ; Set-Content $file.PSpath -Value $filecontent }}"

rem 1. 2021-07-11 - Fix Spider-Man The Video Game Arcade bezelproject decoration and for any other future missing overlays.- reported by Virtualman
robocopy V:\_tools\vman-retrobat-master\RetroBat\decorations\thebezelproject\games\ V:\RetroBat\decorations\thebezelproject\games\ /S /NFL /NDL /IS /MT:4
rem 2. 2021-07-18 - GameCube Controller mapping fix (x/y swap) and for any other future controller profiles for dolphin - reported by Virtualman
robocopy V:\_tools\vman-retrobat-master\RetroBat\emulators\dolphin-emu\ V:\RetroBat\emulators\dolphin-emu\ /S /NFL /NDL /IS /MT:4

rem 3. 2021-08-05 - Corrent snap naming for High Octane - reported by Bilu
ren "V:\RetroBat\roms\dos\snap\Hi Octane.pc.mp4" "Hi Octane.mp4"

rem 4. 2021-10-08 - rpcs3 emulator fix missing HDD PS3 games - reported by Virtualman/Hasinbinsene
robocopy V:\_tools\vman-retrobat-master\RetroBat\emulators\rpcs3\ V:\RetroBat\emulators\rpcs3\ /S /NFL /NDL /IS /MT:4

rem 5. 2021-11-08 - amigacd32 change controller remap to cd32 - reported by Virtualman/Bilu
robocopy V:\_tools\vman-retrobat-master\RetroBat\emulators\retroarch\ V:\RetroBat\emulators\retroarch\ /S /NFL /NDL /IS /MT:4

rem 6. 2021-11-14 - snes9x change controller remap for 'H' some home brew games - reported by Virtualman
robocopy V:\_tools\vman-retrobat-master\RetroBat\emulators\snes9x\ V:\RetroBat\emulators\snes9x\ /S /NFL /NDL /IS /MT:4

rem 7. 2021-12-24 - sync vman custom collections - reported by MrPippet
robocopy V:\_tools\vman-retrobat-master\RetroBat\emulationstation\.emulationstation\collections\ V:\RetroBat\emulationstation\.emulationstation\collections\ /S /NFL /NDL /IS /MT:4

rem 8. 2021-12-28 - EmulationStation Theme fix for Lockdown-Dark_VMAN support for apple2 - reported by Virtualman
robocopy V:\_tools\vman-retrobat-master\RetroBat\emulationstation\.emulationstation\themes\ V:\RetroBat\emulationstation\.emulationstation\themes\ /S /NFL /NDL /IS /MT:4

rem Apply XML-based updates using PowerShell
powershell -ExecutionPolicy Bypass -File V:\_tools\vman-retrobat-master\xml_updates.ps1

echo.
echo Update Completed. Enjoy! :)
echo.
echo Press any key to continue . . .
pause >nul
 