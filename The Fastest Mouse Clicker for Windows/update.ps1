Import-Module AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
		}
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://sourceforge.net/projects/fast-mouse-clicker-pro/files/ -UseBasicParsing
	
	$url        = $download_page.links | ? href -match 'https://sourceforge.net.*nstall.*\.exe' | select -first 1 -ExpandProperty href
	$exename    = $url -split '[/]' | select -Last 1 -Skip 1
    $version    = ($exename -split '[a-z]' | ? { $_ -match '\d'}).replace("_" , ".").trim(".")

	return @{ Version = $version; URL32 = $url; PackageName = 'fastest-mouse-clicker'}
}

Update-Package -ChecksumFor none -NoCheckUrl