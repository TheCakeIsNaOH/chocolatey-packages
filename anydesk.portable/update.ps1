Import-Module AU

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{    
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
		}
	}
}

function global:au_GetLatest {
	$url32        = 'https://download.anydesk.com/AnyDesk.exe'
	$changelogURL = 'https://download.anydesk.com/changelog.txt'

	$download_page = Invoke-WebRequest -Uri $changelogURL -UseBasicParsing
	$regex         = '\(Windows\)'	
	$fullVersion   = ($download_page -split "`n" | sls -Pattern $regex | select -First 1).tostring()
	
	$version       = ($Fullversion -split '\s' | select -Last 1 -Skip 1).tostring()	
	
	return @{ Version = $version; URL32 = $url32 }
}

if ($MyInvocation.InvocationName -ne '.') {
	Update-Package -ChecksumFor none
}