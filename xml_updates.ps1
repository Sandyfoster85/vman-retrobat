$ErrorActionPreference= 'silentlycontinue'

############# Put es_systems.cfg changes in this block ###############
#$es_systems_path = 'V:\RetroBat\emulationstation\.emulationstation\es_systems.cfg'
$es_settings_path = 'V:\RetroBat\emulationstation\.emulationstation\es_settings.cfg'
#[xml]$es_systems = Get-Content $es_systems_path ; 
[xml]$es_settings = Get-Content $es_settings_path ; 

# 1. 2022-12-17 - Correct Arcade extensions in es_systems.cfg, reported by Scorpio
#$arcade = $es_systems.SelectSingleNode("//system[name='arcade']")
#$arcade.extension = '.fba .zip .FBA .ZIP .7z .7Z .bin .BIN'

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

# 1. 2023-01-10 - Update N64 Mupen64plus_next texturepack set to cache  in es_settings.cfg, reported by Virtualman
$n64_hd0 = $es_settings.SelectSingleNode("//string[@name='n64.TexturesPack']")
$n64_hd0.ParentNode.RemoveChild($n64_hd0)
$n64_hd0 = $es_settings.CreateElement("string")
$n64_hd = $es_settings.config.AppendChild($n64_hd0)
$n64_hd.SetAttribute("name","n64.TexturesPack")
$n64_hd.SetAttribute("value","cache")

# 2. 2023-01-15 - Update N64 FoldViewMode in order to see #homebrews
$n64_folderview0 = $es_settings.SelectSingleNode("//string[@name='n64.FolderViewMode']")
$n64_folderview0.ParentNode.RemoveChild($n64_folderview0)
$n64_folderview0 = $es_settings.CreateElement("string")
$n64_folderview = $es_settings.config.AppendChild($n64_folderview0)
$n64_folderview.SetAttribute("name","n64.FolderViewMode")
$n64_folderview.SetAttribute("value","always")

# 3. 2023-01-16 - Update SNES FoldViewMode in order to see #homebrews
$snes_folderview0 = $es_settings.SelectSingleNode("//string[@name='snes.FolderViewMode']")
$snes_folderview0.ParentNode.RemoveChild($snes_folderview0)
$snes_folderview0 = $es_settings.CreateElement("string")
$snes_folderview = $es_settings.config.AppendChild($snes_folderview0)
$snes_folderview.SetAttribute("name","snes.FolderViewMode")
$snes_folderview.SetAttribute("value","always")

# 4. 2023-01-17 - Update Wii FoldViewMode in order to see #homebrews
$wii_folderview0 = $es_settings.SelectSingleNode("//string[@name='wii.FolderViewMode']")
$wii_folderview0.ParentNode.RemoveChild($wii_folderview0)
$wii_folderview0 = $es_settings.CreateElement("string")
$wii_folderview = $es_settings.config.AppendChild($wii_folderview0)
$wii_folderview.SetAttribute("name","wii.FolderViewMode")
$wii_folderview.SetAttribute("value","always")

# 5. 2023-01-18 - Update Dreamcast FoldViewMode in order to see #homebrews
$dreamcast_folderview0 = $es_settings.SelectSingleNode("//string[@name='dreamcast.FolderViewMode']")
$dreamcast_folderview0.ParentNode.RemoveChild($dreamcast_folderview0)
$dreamcast_folderview0 = $es_settings.CreateElement("string")
$dreamcast_folderview = $es_settings.config.AppendChild($dreamcast_folderview0)
$dreamcast_folderview.SetAttribute("name","dreamcast.FolderViewMode")
$dreamcast_folderview.SetAttribute("value","always")

# 6. 2023-01-18 - Update Genesis FoldViewMode in order to see #homebrews
$genesis_folderview0 = $es_settings.SelectSingleNode("//string[@name='genesis.FolderViewMode']")
$genesis_folderview0.ParentNode.RemoveChild($genesis_folderview0)
$genesis_folderview0 = $es_settings.CreateElement("string")
$genesis_folderview = $es_settings.config.AppendChild($genesis_folderview0)
$genesis_folderview.SetAttribute("name","genesis.FolderViewMode")
$genesis_folderview.SetAttribute("value","always")

# 6. 2023-01-18 - Update megadrive FoldViewMode in order to see #homebrews
$megadrive_folderview0 = $es_settings.SelectSingleNode("//string[@name='megadrive.FolderViewMode']")
$megadrive_folderview0.ParentNode.RemoveChild($megadrive_folderview0)
$megadrive_folderview0 = $es_settings.CreateElement("string")
$megadrive_folderview = $es_settings.config.AppendChild($megadrive_folderview0)
$megadrive_folderview.SetAttribute("name","megadrive.FolderViewMode")
$megadrive_folderview.SetAttribute("value","always")

#$es_systems.save($es_systems_path)
$es_settings.save($es_settings_path)
######################################################################
