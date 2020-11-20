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
	$download_page = Invoke-WebRequest -Uri https://dolphin-emu.org/download/ -UseBasicParsing
	$regex         = 'dolphin-master-.*-x64.7z'
    $url64         = $download_page.links | ? href -match $regex | select -First 1 -expand href
	
	$verNum        = ($url64 -split '[-]' | select -Last 2 -Skip 1) -join "."
	$version       = $verNum.ToString() + '-beta'
	
	return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor 64