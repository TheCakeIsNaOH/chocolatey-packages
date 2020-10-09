Import-Module AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"          
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
			"(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://www.4kdownload.com/download -UseBasicParsing
	
	$regex64       = '4kyoutubetomp3_.*_x64_online.exe'
	$regex32       = '4kyoutubetomp3_[.\d]*_online\.exe'
    $url64         = $download_page.links | ? href -match $regex64 | select -First 1 -expand href
	$url32         = $download_page.links | ? href -match $regex32 | select -First 1 -expand href 
	
	$version       = $url64 -split '[_]' | select -Last 1 -Skip 2
	
	$modurl64      = $url64 -replace 'website', 'chocolatey'
	$modurl32      = $url32 -replace 'website', 'chocolatey'
	
	return @{ Version = $version; URL32 = $modurl32; URL64 = $modurl64 }
}

Update-Package