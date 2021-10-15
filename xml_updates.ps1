$ErrorActionPreference= 'silentlycontinue'

############# Put es_systems.cfg changes in this block ###############
$es_systems_path = 'V:\RetroBat\emulationstation\.emulationstation\es_systems.cfg'
[xml]$es_systems = Get-Content $es_systems_path ; 

# 5. 2021-09-03 - Correct Wii U extensions in es_systems.cfg, reported by Bilu
$wiiu = $es_systems.SelectSingleNode("//system[name='wiiu']")
$wiiu.extension = '.iso .rpx .wud .m3u .ISO .RPX .WUD .M3U .wux .WUX'

# 8. 2021-10-15 - Added .chd to Amiga bundle for CDTV
$amiga = $es_systems.SelectSingleNode("//system[name='amiga']")
$amiga.extension = '.zip .ZIP .hdf .HDF .uae .UAE .ipf .IPF .dms .DMS .adz .ADZ .lha .LHA .chd .CHD'

$es_systems.save($es_systems_path) 
######################################################################
