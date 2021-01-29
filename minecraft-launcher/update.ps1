Import-Module AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Update-OnETagChanged.ps1'))

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
			"(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
		}
	}
}

function GetResultInformation([string]$url32) {
  $fileName = Split-path -Leaf $url32
  $version = '1.0.0.0' + "$(get-date -Format 'yyyyMMdd')"
  
  return @{
    URL32          = $url32
    Version        = $version
    RemoteVersion  = $version
    FileName32     = $fileName
  }
}

function global:au_GetLatest {
  $url32 = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
	
  $result = Update-OnETagChanged -execUrl $url32 -OnEtagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 } }

  return $result
}

Update-Package -ChecksumFor none