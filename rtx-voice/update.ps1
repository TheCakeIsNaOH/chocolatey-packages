Import-Module AU
Import-Module Wormies-AU-Helpers

$releases = 'https://www.nvidia.com/en-us/geforce/guides/nvidia-rtx-voice-setup-guide/'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    $regex64       = '.*\.exe'   
    $downloadURL   = $download_page.links | ? href -match $regex64 | select -First 1 -expand href
    $url64         = Get-RedirectedUrl -url $downloadURL
    
    $versionNum    = ($url64 -split '[_]' | select -Last 1 -Skip 1).Trim("v")
    $version       = $versionNum + "-beta"
	
    return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor none