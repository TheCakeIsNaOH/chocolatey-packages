Import-Module AU

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\$File\s*=\s*)(.*)' = "`$1'$($Latest.FileName32)'"
        }
	}
}

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
    $versionData = Invoke-RestMethod -Uri "https://www.gpu-z.com/gpuz/version_v2" -UseBasicParsing
    $version     = $versionData.latest
    $url         = 'https://us2-dl.techpowerup.com/files/GPU-Z.' + $version + '.exe'
    $userAgent   = 'Scoop/1.0'

    return @{ 
        Version = $version; 
        URL32 = $url; 
        PackageName = 'gpu-z'
        Options  = @{ Headers = @{ 'User-Agent' = $useragent } }
    }
}

Update-Package  -ChecksumFor none
