Import-Module AU

function global:au_GetLatest {
	$version_page = (Invoke-WebRequest -Uri http://www.cross-plus-a.com/changelog.txt -UseBasicParsing).content
	
	$version_string = ($version_page.Tostring() -split "[\s]" | sls "(v)(?<ver>\d*\.)" | Select-Object -First 1)
	
	$version_number = $version_string.ToString().substring(1)
	
	$url32 = 'http://balabolka.site/balabolka.zip'
	
	return @{ Version = $version_number; URL32 = $url32 }
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_BeforeUpdate() {
    Remove-Item "tools\*.exe"

	Get-RemoteFiles -Purge -NoSuffix 

	Expand-Archive -Path $([System.IO.Path]::Combine('.', 'tools', 'balabolka.zip')) -DestinationPath "tools" -Force

	Remove-Item "tools\balabolka.zip"
    
    $Latest.Checksum32 = Get-Childitem -Path 'tools' -Filter "*.exe" | Get-FileHash | Select-Object -ExpandProperty hash
}

Update-Package -ChecksumFor none

