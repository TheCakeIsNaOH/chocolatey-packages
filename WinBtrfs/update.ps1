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
	$download_page = Invoke-WebRequest -Uri https://github.com/maharmstone/btrfs/releases -UseBasicParsing
	
	$url        = $download_page.links | ? href -match 'btrfs-\d\.\d[\d\.]*\.zip$' | % href | select -First 1
	$version    = ($url -split '[/]' | select -Last 1 -Skip 1).substring(1)

	return @{ Version = $version; URL32 = $url; PackageName = 'winbtrfs'}
}

Update-Package  -ChecksumFor none