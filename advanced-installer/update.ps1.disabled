Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"          
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://www.advancedinstaller.com/version-history.html -UseBasicParsing
	$regex         = 'release-\d'
    $versionNotes  = $download_page.links | ? href -match $regex | select -First 1 -expand href
	
	
	$version       = $versionNotes -replace '^release-','' -replace '\.html$',''
	$url32         = 'https://www.advancedinstaller.com/downloads/' + $version.ToString() + '/advinst.msi'
	
	return @{ Version = $version; URL32 = $url32 }
}

Update-Package -ChecksumFor none