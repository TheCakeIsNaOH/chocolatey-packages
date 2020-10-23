import-module au

$releases = 'https://github.com/muslayev/iceweasel-win64/releases'

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url64 = $page.links | ? { $_.href -match '.exe$' } | select -expand href -First 1
    $version = ($url64 -split '/' | select -Last 1 -Skip 1).Replace('v','')

    @{
        URL64      = 'https://github.com' + $url64
        Version    = $version
        ChangeLog  = '[Firefox ESR](https://www.mozilla.org/en-US/firefox/' + $version + '/releasenotes/)'
    }
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        "iceweasel.nuspec" = @{
            "(\<releaseNotes\>).*(\<\/releaseNotes\>)" = "`${1}$($Latest.ChangeLog)`$2"
        }
    }
}

function global:au_BeforeUpdate {
     Get-RemoteFiles -Purge
}

update -ChecksumFor none