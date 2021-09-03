$ErrorActionPreference= 'silentlycontinue'

############# Put es_systems.cfg changes in this block ###############
$es_systems_path = 'V:\RetroBat\emulationstation\.emulationstation\es_systems.cfg'
[xml]$es_systems = Get-Content $es_systems_path ; 

# 5. 2021-09-03 - Correct Wii U extensions in es_systems.cfg, reported by Bilu
$wiiu = $es_systems.SelectSingleNode("//system[name='wiiu']")
$wiiu.extension = '.iso .rpx .wud .m3u .ISO .RPX .WUD .M3U .wux .WUX'

$es_systems.save($es_systems_path) 
######################################################################