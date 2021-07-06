Import-Module AU

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://constexpr.org/innoextract/files/ -UseBasicParsing
	
	$full_version  = $download_page.links | ? href -match 'innoextract-\d\.\d' | % href | select -last 1
	$version    = ($full_version -split '-' | select -Last 1).trim('/')
	$url        = 'https://constexpr.org/innoextract/files/innoextract-' + $version + '/innoextract-' + $version + '-windows.zip'

	return @{ Version = $version; URL32 = $url; PackageName = 'innoextract'}
}

Update-Package  -ChecksumFor none