Import-Module AU

function global:au_GetLatest {
	$version_page = (Invoke-WebRequest -Uri http://balabolka.site/changelog.txt -UseBasicParsing).content
	
	$version_string = ($test.Tostring() -split "[\s]" | sls "(v)(?<ver>\d*\.)" | Select-Object -First 1)
	
	$version_number = $version_string.ToString().substring(1)
	
	$url32 = 'http://balabolka.site/balabolka.zip'
	
	return @{ Version = $version_number; URL32 = $url32 }
}


#update -ChecksumFor none

#Get-RemoteFiles -Purge -NoSuffix 