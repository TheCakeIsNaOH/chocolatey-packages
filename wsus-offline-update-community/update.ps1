Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\s*\$file\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }  
        <#".\wsus-offline-update-community.nuspec"  = @{
            "(?i)(^\s*\<title\>).*(\<\/title\>)" = "`${1}$($Latest.Title)`${2}"
        } #>
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $releasesData = Invoke-RestMethod -Method Get -UseBasicParsing -Uri "https://gitlab.com/api/v4/projects/19504919/releases"
    
    $normalRelease = $releasesData | Where-Object tag_name -match "\d\d\.\d[\d\.]*_CommunityEdition" | Select-Object -First 1
    $normalReleaseVersion = $normalRelease.tag_name -split "_" | Select-Object -First 1
    $normalReleaseUrl = "https://gitlab.com/wsusoffline/wsusoffline" + (($normalRelease.description -split "`n" | Where-Object { $_ -match "wsusofflineCE\d{3,4}.zip" }) -split "\(" | Select-Object -Last 1).trimend(")")

    $esrRelease = $releasesData | Where-Object tag_name -match "\d\d\.\d[\d\.]*esr_CommunityEdition" | Select-Object -First 1
	$esrReleaseVersion = $esrRelease.tag_name -split "esr_" | Select-Object -First 1
    $esrReleaseUrl = "https://gitlab.com/wsusoffline/wsusoffline" + (($esrRelease.description -split "`n" | Where-Object { $_ -match "wsusofflineCE\d{3,5}.zip" }) -split "\(" | Select-Object -Last 1).trimend(")")

    <#return @{   
                Streams = [ordered] @{
                        'Normal' = @{ 
                            Version = $normalReleaseVersion; 
                            URL32 = $normalReleaseUrl; 
                            FileType = 'zip';
                            Title = "WSUS Offline Update Community Edition"
                            }
                        'ESR' = @{
                            Version = $esrReleaseVersion; 
                            URL32 = $esrReleaseUrl; 
                            FileType = 'zip';
                            Title = "WSUS Offline Update Community Edition (ESR)"
                        }
                }
            } #>
    
    return @{
        URL32        = $normalReleaseUrl
        Version      = $normalReleaseVersion
		FileType     = 'zip'
    }
}

Update-Package -ChecksumFor none