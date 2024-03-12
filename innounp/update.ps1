Import-Module Chocolatey-AU
#needed to use [Microsoft.PowerShell.Commands.PSUserAgent] when running in pwsh
Import-Module Microsoft.PowerShell.Utility

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt" = @{
			"(?i)(\s+x32:).*" = "`${1} $($Latest.URL32)"
		}
	}
}

function global:au_BeforeUpdate() {
	Remove-Item -Path ".\tools\*.exe"
	Remove-Item -Path ".\tools\*.htm"
	$filename = $Latest.Url32 -split "/" | select -last 1 -skip 1
	Invoke-WebRequest -Uri $Latest.Url32 -OutFile ".\tools\$filename" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
	#Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1
	7z e -otools $(Get-Childitem -Filter "*.rar" -Path ".\tools").FullName
	Remove-Item -Path ".\tools\*.rar"
}


function global:au_GetLatest {
    $download_page   = Invoke-WebRequest -UseBasicParsing -Uri https://sourceforge.net/projects/innounp/files/innounp/
    $folderUrl       = "https://sourceforge.net" + "$($download_page.links | ? href -match 'innounp%20\d\.\d\d' | select -first 1 -ExpandProperty href)"
    $download_folder = Invoke-WebRequest -UseBasicParsing -Uri $folderURL
    $url32           = $download_folder.links | ? href -match 'http.*\d\d\.rar' | select -first 1 -ExpandProperty href
    $version         = ($folderUrl.trim("/") -split '/' | select -Last 1) -split "\%20" | select -Last 1
	
    $useragent       = [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
	
    return @{ 
		Version = $version; 
		URL32 = $url32; 
		PackageName = 'innounp'; 
		FileType = 'rar';
		Options = @{ Headers = @{ 'User-Agent' = $useragent } }
    }
}

Update-Package -ChecksumFor none -NoCheckURL

#fix get-remotefiles