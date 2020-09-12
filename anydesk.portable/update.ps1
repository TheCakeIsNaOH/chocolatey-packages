Import-Module AU
Import-Module "$env:ChocolateyInstall/helpers/chocolateyInstaller.psm1"
. "..\_scripts\Update-OnETagChanged.ps1"

$Url32 = 'https://download.anydesk.com/AnyDesk.exe'


function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{    
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
		}
	}
}

function GetResultInformation([string]$url32) {
  $fileName = Split-path -Leaf $url32
  $dest = "$($env:temp)\$((new-guid).guid)\$fileName"

  Get-WebFile $url32 $dest
    
  $item = Get-Item $dest
  $version = $item.VersionInfo.FileVersion

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

if ($MyInvocation.InvocationName -ne '.') {
	Update-Package -ChecksumFor none
}