@echo off
echo Run this only once, required for some Teknoparrot games!
echo.
pause

mklink /J C:\FF V:\RetroBat\roms\teknoparrot\FNF.parrot
mklink /J C:\FNFSC V:\RetroBat\roms\teknoparrot\FNFSC.parrot
mklink /J C:\SCJC V:\RetroBat\roms\teknoparrot\SnoCross.parrot 
mklink /D C:\rawart C:\SCJC
mklink /J C:\FNFSB V:\RetroBat\roms\teknoparrot\FNFSB.parrot
mklink /J C:\FNFSB2 V:\RetroBat\roms\teknoparrot\FNFSB2.parrot

echo mklink created
pause