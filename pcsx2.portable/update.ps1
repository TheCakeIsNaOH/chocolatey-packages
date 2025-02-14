Import-Module Chocolatey-AU
Import-Module Wormies-AU-Helpers
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\$file64\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.filename64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.url64)"
            "(?i)(checksum64:).*"         = "`${1} $($Latest.checksum64)"
        }
	}
}

function global:au_BeforeUpdate {
    $Latest.URL64 = $Latest.url64  
    Get-RemoteFiles -Purge -NoSuffix
    $Latest.filename64 = $Latest.Filename64
    $Latest.checksum64 = $Latest.Checksum64
}

function global:au_GetLatest {
	$download_page = Get-GitHubLatestReleaseLinks -User "PCSX2" -Repository "pcsx2"
    
    $regex64 = "pcsx2-v[\d\.]*-windows-x64-Qt.7z"
    $url64   = 'https://github.com' + ($download_page.links | ? href -match $regex64 | select -First 1 -expand href)

	$version   = ($url64 -split "/" | select -Last 1 -Skip 1).trim("v")
	return @{ 
        Version = $version
        FileType = "7z"
        url64 = $url64
    }
}

Update-Package -ChecksumFor none
