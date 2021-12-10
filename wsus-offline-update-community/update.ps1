Import-Module AU

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\s*\$file\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }  
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $releasesData = Invoke-RestMethod -Method Get -UseBasicParsing -Uri "https://gitlab.com/api/v4/projects/19504919/releases"
    
    $normalRelease = $releasesData | Where-Object tag_name -match "\d\d\.\d[\d\.]*_CommunityEdition" | Select-Object -First 1
    $normalReleaseVersion = $normalRelease.tag_name -split "_" | Select-Object -First 1
    $normalReleaseUrl = $normalRelease.assets.sources | Where-Object format -eq "zip" | Select-Object -ExpandProperty url
    
    #TODO, add support for ESR stream.
    $esrRelease = $releasesData | Where-Object tag_name -match "\d\d\.\d[\d\.]*esr_CommunityEdition" | Select-Object -First 1
	
    return @{
        URL32        = $normalReleaseUrl
        Version      = $normalReleaseVersion
		FileType     = 'zip'
    }
}

Update-Package -ChecksumFor none