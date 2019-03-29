﻿
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Url = 'https://get.openlp.org/2.4.6/OpenLP-2.4.6-setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  Url 			= $Url
  softwareName  = 'OpenLP*'
  checksum      = '954326ec4d9bd8ce060003889934879cb3c93a7965840a7e9464e87a4cb5f74c'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs