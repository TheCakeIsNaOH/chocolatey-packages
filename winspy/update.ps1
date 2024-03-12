Import-Module Chocolatey-AU
Import-Module Wormies-AU-Helpers
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(FileFullPath\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.filename32)'"
            '(?i)(FileFullPath64\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.filename64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"             = "`${1} $($Latest.url32)"
            "(?i)(\s+x64:).*"             = "`${1} $($Latest.url64)"
            "(?i)(checksum32:).*"         = "`${1} $($Latest.checksum32)"
            "(?i)(checksum64:).*"         = "`${1} $($Latest.checksum64)"
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
	$download_page = Get-GitHubLatestReleaseLinks -User "strobejb" -Repository "winspy" -AbsoluteLatestRelease
    
    $regex32 = "x86.zip"
    $regex64 = "x64.zip"
    $url32   = 'https://github.com' + ($download_page.links | ? href -match $regex32 | select -First 1 -expand href)
    $url64   = 'https://github.com' + ($download_page.links | ? href -match $regex64 | select -First 1 -expand href)

	$version   = ($url64 -split "/" | select -Last 1 -Skip 1).trim("v")
	return @{ 
        Version  = $version
        FileType = "zip"
        url32    = $url32
        url64    = $url64
    }
}

Update-Package -ChecksumFor none
