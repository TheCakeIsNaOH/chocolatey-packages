Import-Module Chocolatey-AU

$versionsApi = 'https://versionhistory.googleapis.com/v1/chrome/platforms/win/channels/canary/versions'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(?i)(^[$]version\s*=\s*)('.*')" = "`$1'$($Latest.RemoteVersion)'"
    }
  }
}

function global:au_GetLatest {
  $versions_info = Invoke-RestMethod -Method Get -UseBasicParsing -Uri $versionsApi
  $version = $versions_info.versions | Select-Object -First 1 -ExpandProperty version
  $version = "$version-canary"

  @{
    URL32 = [URI]::EscapeUriString('https://dl.google.com/tag/s/appguid={4EA16AC7-FD5A-47C3-875B-DBF4A2008C20}&usagestats=1&ap=-statsdef_1/update2/installers/ChromeSetup.exe')
    Version = $version
    RemoteVersion = $version
  }
}

update -ChecksumFor none
