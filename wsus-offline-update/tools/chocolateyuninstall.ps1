$ErrorActionPreference = 'Stop'
$linkNameGen           = "UpdateGenerator.lnk"
$linkNameInst          = "UpdateInstaller.lnk"
$startmenu             = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePathGen   = Join-Path $startmenu $linkNameGen
$shortcutFilePathInst  = Join-Path $startmenu $linkNameInst

if(Test-Path $shortcutFilePathGen) {
    del $shortcutFilePathGen
}

if(Test-Path $shortcutFilePathInst) {
    del $shortcutFilePathInst
}