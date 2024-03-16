Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "openzfsonwindows" -Repository "openzfs"
	
    $match64 = ".*\.exe"
    $url64   = 'https://github.com' + ($download_page.links | ? href -match $match64 | Select-Object -First 1 -ExpandProperty href)
    
	$version    = ($url64 -split '/' | select -Last 1 -Skip 1).trim("zfswin-") -replace "rc", "-rc"
    
	return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor none