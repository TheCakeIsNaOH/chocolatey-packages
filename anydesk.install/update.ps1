Import-Module AU
#Import-Module MSI
Import-Module $([System.IO.Path]::Combine($env:ChocolateyInstall, 'helpers', 'chocolateyInstaller.psm1'))
. $([System.IO.Path]::Combine("..", '_scripts', 'Update-OnETagChanged.ps1'))
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-MsiDatabaseVersion.ps1'))

$Url32 = 'https://download.anydesk.com/AnyDesk.msi'

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{    
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url32\s*=\s*)('.*')" = "`$1'$($Latest.Url32)'"
		}
	}
}

function GetResultInformation([string]$url32) {
  $fileName = Split-path -Leaf $url32
  $dest = $([System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), $((new-guid).guid), $fileName))

  Get-WebFile $url32 $dest

  #Linux: msiinfo export AnyDesk.msi Property | grep ProductVersion | cut -c 16-
  #$version       = (Get-MSIProperty -Path $dest -Property ProductVersion).value.tostring()
  if ($isLinux) {
      $version = & msiinfo export $dest Property | grep ProductVersion | cut -c 16-
  } else {
      $version = ([string](Get-MsiDatabaseVersion $dest)).trim()
  }

  return @{
    URL32          = $url32
    Version        = $version
    RemoteVersion  = $version
    FileName32     = $fileName
  }
}

function global:au_GetLatest {
  $result = Update-OnETagChanged -execUrl $url32 -OnEtagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 } }

  return $result
}

Update-Package -ChecksumFor none
