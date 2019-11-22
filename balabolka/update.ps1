$ErrorActionPreference = 'Stop'
Import-Module AU

function global:au_GetLatest {
	$version_page = (Invoke-WebRequest -Uri http://balabolka.site/changelog.txt -UseBasicParsing).content
	
	$version_string = ($version_page.Tostring() -split "[\s]" | sls "(v)(?<ver>\d*\.)" | Select-Object -First 1)
	
	$version_number = $version_string.ToString().substring(1)
	
	$url32 = 'http://balabolka.site/balabolka.zip'
	
	return @{ Version = $version_number; URL32 = $url32 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
        }
    }
}

function global:au_BeforeUpdate() {

	Get-RemoteFiles -Purge -NoSuffix 

	Expand-Archive -Path ".\tools\balabolka.zip" -DestinationPath "tools" -Force

	Remove-Item "tools\balabolka.zip"
}

update-package  -ChecksumFor none

