Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
			"(?i)(^\s*url64bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "godotengine" -Repository "FBX2glTF"
	
    $match64 = ".*windows-x86_64\.zip"
    
    $url64      = 'https://github.com' + ($download_page.links | ? href -match $match64 | Select-Object -First 1 -ExpandProperty href)
    
	$version    = ($url64 -split '/' | select -Last 1 -Skip 1).trim("v")
    
	return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor none