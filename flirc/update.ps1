Import-Module Chocolatey-AU

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyinstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
    $updatesApiUrl = "http://flirc.com/software/release/gui/windows/appcast.xml"
    [xml]$updatesApiPage = Invoke-WebRequest -Uri $updatesApiUrl -UseBasicParsing

    $url32 = $updatesApiPage.rss.channel.item.enclosure.url
    $version = $updatesApiPage.rss.channel.item.enclosure.version

    return @{ Version = $version; URL32 = $url32 }
}

Update-Package -ChecksumFor none
