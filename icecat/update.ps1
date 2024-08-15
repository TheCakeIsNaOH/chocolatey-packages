Import-Module Chocolatey-AU

$releases = 'https://icecatbrowser.org/all_downloads.html'

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url64 = $page.links | ? { $_.href -match 'win64.installer.exe$' } | select -expand href -First 1
    $version = ($url64 -split '/' | select -Last 1 -Skip 1)

    @{
        URL64      = 'https://icecatbrowser.org/' + $url64
        Version    = $version
        ChangeLog  = '[GNU IceCat](https://git.savannah.gnu.org/cgit/gnuzilla.git/tree/data/Changelog.IceCat), ' + '[Firefox ESR](https://www.mozilla.org/en-US/firefox/' + $version + '/releasenotes/)'
    }
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        "icecat.nuspec" = @{
            "(\<releaseNotes\>).*(\<\/releaseNotes\>)" = "`${1}$($Latest.ChangeLog)`$2"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }   
    }
}

function global:au_BeforeUpdate {
     Get-RemoteFiles -Purge
}

Update-Package -ChecksumFor none