Import-Module AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "seerge" -Repository "g-helper"
	
    $match32 = "ghelper.zip"
    $url32   = 'https://github.com' + ($download_page.links | ? href -match $match32 | Select-Object -First 1 -ExpandProperty href)
    
	$version    = ($url32 -split '/' | select -Last 1 -Skip 1).trim("v")
    
	return @{ Version = $version; URL32 = $url32 }
}

Update-Package -ChecksumFor none