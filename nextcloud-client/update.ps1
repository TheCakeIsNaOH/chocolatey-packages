Import-Module AU


function global:au_SearchReplace {
    @{
        "tools\VERIFICATION.txt" = @{
			"(?i)(\s+x32:).*" = "`${1} $($Latest.URL32)"
		}
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
	#docsUrl = "https://docs.nextcloud.com/desktop/"
	$download_page = Invoke-WebRequest -Uri https://download.nextcloud.com/desktop/releases/Windows -UseBasicParsing
	
	$filename   = $download_page.links | ? href -match '.exe$'| % href | select -last 1
	$version    = ($filename -split '[-]' | select -Last 1 -Skip 1).replace('_','-')
	$modurl     = 'https://download.nextcloud.com/desktop/releases/Windows/' + $filename
	
	$partVersion = ($version -split '\.' | select -First 2) -join "."
	#$docsUrl = $docsUrl + $partVersion
	
	return @{ Version = $version; URL32 = $modurl; PackageName = 'nextcloud-client'; }
}

#Update-Package -ChecksumFor none -nocheckurl #-nocheckchocoversion

#todo
# AU
# re add in docs URL
#	<docsUrl>https://docs.nextcloud.com/desktop/2.6</docsUrl>
#		".\nextcloud-client.nuspec" = @{
#			"\<docsUrl\>.+" = "<docsUrl>$($Latest.docsUrl)</docsUrl>"
#		}