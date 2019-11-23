Import-Module AU

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://www.oo-software.com/en/ooregeditor -UseBasicParsing
		
	$version_number = ($download_page.ToString() -split "[<>\s]" | sls "\d\d\.\d\.\d\d\d\d" | Select-Object -First 1).ToString()
	
	$url32 = $download_page.links | ? href -match 'ooregeditor\.zip' | % href | select -First 1
	
	return @{ Version = $version_number; URL32 = $url32; PackageName = 'regeditor' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
        }
    }
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix
}

Update-Package  -ChecksumFor none