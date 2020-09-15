Import-Module AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri https://help.elgato.com/hc/en-us/articles/360027964072-Elgato-Game-Capture-HD-Software-Release-Notes-Windows
    $regex64       = 'GameCaptureSetup_\d.*_x64\.msi'
    $url64         = $download_page.links | ? href -match $regex64 | select -First 1 -Skip 1 -expand href
    $version       = $url64 -split '[_]' | select -Last 1 -Skip 1
	
	return @{ 
		Version = $version; 
		URL64 = $url64;
		PackageName = 'elgato-game-capture'; 
	}
}

Update-Package -ChecksumFor 64