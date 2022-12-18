@echo off
echo Restoring configs...
rem #######################################
rem VMan Backup/Restore Config v3.5.0.1 by Bilu
rem #######################################
rem Tool to retain VMan customizations through a RetroBat upgrade.

set BASE=V:\RetroBat
set EMULATIONSTATION=%BASE%\emulationstation\.emulationstation
set DRIVE=V:

rem Prevent RetroBat update notifications to discourage emulator updates.
rem We had issues with newer versions of Teknoparrot, Citra, lr-mame and lr-fbneo.
rem Users can still update emulators at their own risk. 
attrib -r %TEMP%\emulationstation.tmp\versions.xml > NUL 2>&1
xcopy /Q /Y /-I %BASE%\backup\emu_versions\versions.xml %TEMP%\emulationstation.tmp\versions.xml > NUL 2>&1
attrib +r %TEMP%\emulationstation.tmp\versions.xml > NUL 2>&1

for %%I in (^ 
 %BASE%\retrobat.ini^
 %BASE%\emulationstation\version.info^
 %BASE%\system\padtokey\*.keys^
 %EMULATIONSTATION%\es_padtokey.cfg^
 %EMULATIONSTATION%\es_systems.cfg^
 %EMULATIONSTATION%\es_settings.cfg^
 %BASE%\emulators\supermodel\Config\supermodel.ini^
 %BASE%\emulators\retroarch\cores\mame_libretro.dll^
 %BASE%\emulators\retroarch\cores\fbneo_libretro.dll^
 ) do xcopy /Q /Y /-I %%I %BASE%\backup\rb%%~pI > NUL 2>&1

for %%I in (^ 
 %BASE%\emulationstation\version.info^
 ) do xcopy /Q /Y %%I %BASE%\backup\vman%%~pI > NUL 2>&1
del /Q /F %BASE%\emulationstation\.emulationstation\video\retrobat-*.mp4 > NUL 2>&1
rmdir /s /q %BASE%\emulationstation\.emulationstation\themes\es-theme-carbon > NUL 2>&1
del /Q /F %BASE%\roms\ports\*.libretro > NUL 2>&1
del /Q /F "%EMULATIONSTATION%\music\2080*.ogg" > NUL 2>&1
del /Q /F "%EMULATIONSTATION%\music\Le Brick*.ogg" > NUL 2>&1
del /Q /F "%EMULATIONSTATION%\music\Sawsquarenoise*.ogg" > NUL 2>&1
del /Q /F "%EMULATIONSTATION%\music\Starbox*.ogg" > NUL 2>&1
robocopy /NFL /NDL /NJH /NJS /nc /ns /np /S %BASE%\backup\vman %DRIVE%\

for %%I in (^ 
 %BASE%\retrobat.ini^
 %BASE%\emulationstation\.emulationstation\es_padtokey.cfg^
 %BASE%\emulationstation\.emulationstation\es_systems.cfg^
 %BASE%\system\padtokey\*.keys^
 %BASE%\emulators\supermodel\Config\supermodel.ini^
 %BASE%\emulators\retroarch\cores\mame_libretro.dll^
 %BASE%\emulators\retroarch\cores\fbneo_libretro.dll^
 %BASE%\system\es_menu\vman*.menu^
 %BASE%\system\es_menu\gamelist.xml^
 %BASE%\system\es_menu\media\vman*.png^
 %BASE%\RetroBat\roms\ports\gamelist.xml^
 ) do xcopy /Q /Y /-I %BASE%\backup\vman_orig%%~pnxI %%I > NUL 2>&1

xcopy /Q /Y /-I %BASE%\backup\vman_backupcfg.bat %BASE%\emulationstation\.emulationstation\scripts\quit\vman_backupcfg.bat > NUL 2>&1



