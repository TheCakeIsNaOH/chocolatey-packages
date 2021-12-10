$ErrorActionPreference = 'Stop'
$linkNameGen           = "WSUS Offline Community Edition UpdateGenerator.lnk"
$linkNameInst          = "WSUS Offline Community Edition UpdateInstaller.lnk"
$startmenu             = [System.Environment]::GetFolderPath('Programs')
$shortcutFilePathGen   = Join-Path $startmenu $linkNameGen
$shortcutFilePathInst  = Join-Path $startmenu $linkNameInst

if(Test-Path $shortcutFilePathGen) {
    Remove-Item $shortcutFilePathGen
}

if(Test-Path $shortcutFilePathInst) {
    Remove-Item $shortcutFilePathInst
}