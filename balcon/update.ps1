Import-Module Chocolatey-AU

function global:au_GetLatest {
	$version_page = (Invoke-WebRequest -Uri http://www.cross-plus-a.com/balcon/changelog.txt -UseBasicParsing).content
	
	$version_string = ($version_page.Tostring() -split "[\s]" | sls "(v)(?<ver>\d*\.)" | Select-Object -First 1)
	
	$version_number = $version_string.ToString().substring(1)
	
	$url32 = 'http://www.cross-plus-a.com/balcon.zip'
	
	return @{ Version = $version_number; URL32 = $url32 }
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(checksumExe:).*"        = "`${1} $($Latest.ChecksumExe)"
            "(?i)(checksumDll:).*"        = "`${1} $($Latest.ChecksumDll)"
        }
    }
}

function global:au_BeforeUpdate() {
    Remove-Item "tools\*.exe"
    Remove-Item "tools\*.dll"

	Get-RemoteFiles -Purge -NoSuffix 

	Expand-Archive -Path ".\tools\balcon.zip" -DestinationPath "tools" -Force

	Remove-Item "tools\balcon.zip"
    
    $Latest.ChecksumExe = Get-Childitem -Path 'tools' -Filter "*.exe" | Get-FileHash | Select-Object -ExpandProperty hash
    $Latest.ChecksumDll = Get-Childitem -Path 'tools' -Filter "*.dll" | Get-FileHash | Select-Object -ExpandProperty hash
}

Update-Package -ChecksumFor none

