Import-Module Chocolatey-AU

$releasev4 = 'https://release.tinymediamanager.org/download_v4.html'
$releasev5 = 'https://release.tinymediamanager.org/download_v5.html'

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*url(64)?\:\s*).*"        = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum(64)?\:\s*).*"   = "`${1}$($Latest.Checksum64)"
      "(?i)(^\s*checksumType64\:\s*).*" = "`${1}$($Latest.ChecksumType64)"
    }
    ".\tools\chocolateyinstall.ps1" = @{
        "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
    }
  }
}

function global:au_BeforeUpdate($Package) {
  Get-RemoteFiles -Purge -NoSuffix
}

function GetV5Version() {
  $download_page = Invoke-WebRequest -Uri $releasev5 -UseBasicParsing
  #https://release.tinymediamanager.org/v5/dist/tinyMediaManager-5.0.1.1-Setup.exe
  $re = "tinyMediaManager-5.+-Setup.exe$"
  $url = $download_page.links | Where-Object href -Match $re | Select-Object -Last 1 -expand href

  $version = $url -split 'tinyMediaManager-|-.*-?.exe' | Select-Object -Last 1 -Skip 1
  $url64 = 'https://release.tinymediamanager.org/' + $url

  @{
    Version = $version
    URL64   = $url64
  }
}

function GetV4Version() {
  $download_page = Invoke-WebRequest -Uri $releasev4 -UseBasicParsing

  # https://release.tinymediamanager.org/v4/dist/tinyMediaManagerSetup.exe
  $re = "tinyMediaManagerSetup.exe$"
  $url = $download_page.links | Where-Object href -Match $re | Select-Object -Last 1 -expand href

  $reZip = "tmm_4.+_*_windows-amd64.zip$"
  $urlZip = $download_page.links | Where-Object href -Match $reZip | Select-Object -Last 1 -expand href
  $version = $urlZip -split 'tmm_|_.*_?.zip' | Select-Object -Last 1 -Skip 1
  $url64 = 'https://release.tinymediamanager.org/' + $url

  @{
    Version = $version
    URL64   = $url64
  }
}

function global:au_GetLatest {
  #$v4Stream = GetV4Version
  $v5Stream = GetV5Version

  $streams = [ordered] @{
    #v4 = $v4Stream
    v5 = $v5Stream
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none
