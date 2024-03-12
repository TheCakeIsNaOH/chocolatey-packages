Import-Module Chocolatey-AU

$versionsApi = 'https://versionhistory.googleapis.com/v1/chrome/platforms/win/channels/dev/versions'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*url64bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(?i)(^[$]version\s*=\s*)('.*')" = "`$1'$($Latest.RemoteVersion)'"
    }
  }
}

function global:au_GetLatest {
  $versions_info = Invoke-RestMethod -Method Get -UseBasicParsing -Uri $versionsApi
  $version = $versions_info.versions | Select-Object -First 1 -ExpandProperty version
  $version = "$version-dev"

  @{
    URL32 = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise.msi'
    URL64 = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise64.msi'
    Version = $version
    RemoteVersion = $version
  }
}

update -ChecksumFor none
