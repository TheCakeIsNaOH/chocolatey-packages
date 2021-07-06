Import-Module AU

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\s*\$filelocation\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }  
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://github.com/maharmstone/winmd/releases -UseBasicParsing
	
	$url        = $download_page.links | ? href -match '.zip$'| % href | select -First 1
	$version    = ($url -split '[/]' | select -Last 1 -Skip 1).substring(1)
	$modurl     = 'https://github.com' + $url 

	return @{ Version = $version; URL32 = $modurl; PackageName = 'winmd'}
}

Update-Package -ChecksumFor none