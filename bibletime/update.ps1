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
	$download_page = Invoke-WebRequest -Uri https://github.com/bibletime/bibletime/releases -UseBasicParsing
	
	$url        = $download_page.links | ? href -match '.exe$'| % href | select -First 1
	$version    = ($url -split '[-]' | select -Last 1 -Skip 1).replace('_','-')
	$modurl     = 'https://github.com' + $url 
	
	return @{ Version = $version; URL32 = $modurl; PackageName = 'bibletime'}
}

Update-Package -ChecksumFor none