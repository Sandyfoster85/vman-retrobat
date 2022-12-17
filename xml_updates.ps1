$ErrorActionPreference= 'silentlycontinue'

############# Put es_systems.cfg changes in this block ###############
$es_systems_path = 'V:\RetroBat\emulationstation\.emulationstation\es_systems.cfg'
$es_settings_path = 'V:\RetroBat\emulationstation\.emulationstation\es_settings.cfg'
[xml]$es_systems = Get-Content $es_systems_path ; 
[xml]$es_settings = Get-Content $es_settings_path ; 

# 1. 2022-12-17 - Correct Arcade extensions in es_systems.cfg, reported by Scorpio
$arcade = $es_systems.SelectSingleNode("//system[name='arcade']")
$arcade.extension = '.fba .zip .FBA .ZIP .7z .7Z .bin .BIN'

# 8. 2021-10-15 - Added .chd to Amiga bundle for CDTV
#$amiga = $es_systems.SelectSingleNode("//system[name='amiga']")
#$amiga.extension = '.zip .ZIP .hdf .HDF .uae .UAE .ipf .IPF .dms .DMS .adz .ADZ .lha .LHA .chd .CHD'

# 11. 2021-11-12 - Added .chd to Amiga bundle for CD32
#$amigacd32 = $es_systems.SelectSingleNode("//system[name='amigacd32']")
#$amigacd32.extension = '.iso .cso .cue .zip .lha .ISO .CSO .CUE .ZIP .LHA .rp9 .RP9 .chd .CHD'

# 10. 2021-11-09 - Improved configurations for Amiga 500/1200/CDTV
#$es_settings.SelectSingleNode("//string[@name='amiga.core']").SetAttribute("value","puae")
#$es_settings.SelectSingleNode("//string[@name='amiga.cpu_compatibility']").SetAttribute("value","exact")
#$es_settings.SelectSingleNode("//string[@name='amiga.emulator']").SetAttribute("value","libretro")
#$es_settings.SelectSingleNode("//string[@name='amiga.ratio']").SetAttribute("value","4/3")
#$es_settings.SelectSingleNode("//string[@name='amiga.video_resolution']").SetAttribute("value","superhires")
#$amiga_zoom = $es_settings.SelectSingleNode("//string[@name='amiga.zoom_mode']")
#$amiga_zoom.ParentNode.RemoveChild($amiga_zoom)

# 10. 2021-11-09 - Improved configurations for Amiga CD32
#$es_settings.SelectSingleNode("//string[@name='amigacd32.core']").SetAttribute("value","puae")
#$es_settings.SelectSingleNode("//string[@name='amigacd32.cpu_compatibility']").SetAttribute("value","exact")
#$es_settings.SelectSingleNode("//string[@name='amigacd32.emulator']").SetAttribute("value","libretro")
#$es_settings.SelectSingleNode("//string[@name='amigacd32.ratio']").SetAttribute("value","4/3")
#$es_settings.SelectSingleNode("//string[@name='amigacd32.video_resolution']").SetAttribute("value","superhires")
#$es_settings.SelectSingleNode("//string[@name='amigacd32.zoom_mode']")
#$amigacd32_zoom = $es_settings.SelectSingleNode("//string[@name='amigacd32.zoom_mode']")
#$amigacd32_zoom.ParentNode.RemoveChild($amigacd32_zoom)

# 11. 2022-01-11 - Updated description for VIC-20, Amiga and CD32
#$vic20 = $es_systems.SelectSingleNode("//system[name='c20']")
#$vic20.fullname = 'Commodore VIC-20'
#$amiga.fullname = 'Commodore Amiga'
#$amigacd32.fullname = 'Commodore Amiga CD32'

# 12. 2022-04-02 - Update M.U.G.E.N extensions in es_systems.cfg, reported by Virtualman
#$mugen = $es_systems.SelectSingleNode("//system[name='mugen']")
#$mugen.extension = '.lnk .LNK'

$es_systems.save($es_systems_path)
$es_settings.save($es_settings_path)
######################################################################
