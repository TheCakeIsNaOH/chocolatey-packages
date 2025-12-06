Import-Module Chocolatey-AU
Import-Module $([System.IO.Path]::Combine($env:ChocolateyInstall, 'helpers', 'chocolateyInstaller.psm1'))
. $([System.IO.Path]::Combine("..", '_scripts', 'Update-OnETagChanged.ps1'))
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-RemoteChecksumVersion.ps1'))

$url64 = 'https://drivers.amd.com/drivers/amdcleanuputility.exe'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

$Headers = @{ 
    Accept  = '*/*'
    Referer = 'https://www.amd.com/en/resources/support-articles/faqs/GPU-601.html' 
    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
}

<# function global:au_BeforeUpdate {
    $Headers = @{ 
      "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
      Accept  = '*/*'
      Referer = 'https://www.amd.com/en/resources/support-articles/faqs/GPU-601.html' 
    }
    $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.URL64 -Headers $headers
} #>

function GetResultInformation([string]$url64) {
  $fileName = Split-path -Leaf $url64
  $dest = $([System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), $((new-guid).guid), $fileName))

  $result = Get-RemoteChecksumVersion -Url $URL64 -Headers $headers
  $version = $result[1]
  $checksum64 = $result[0]

  return @{
    URL64          = $url64
    Version        = $version
    RemoteVersion  = $version
    FileName64     = $fileName
    Checksum64     = $checksum64
  }
}

function global:au_GetLatest {
  $result = Update-OnETagChanged -execUrl $url64 -OnEtagChanged {
    GetResultInformation $url64
  } -OnUpdated { @{ url64 = $url64 } } -headers $headers

  return $result
}

Update-Package -ChecksumFor none -NoCheckUrl