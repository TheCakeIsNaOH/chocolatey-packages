Import-Module AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*FileFullPath64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
        ".\tools\chocolateyuninstall.ps1" = @{
            "(?i)(^\s*FilePath\s*=\s*)(.*)" = "`$1'$($Latest.FileName32)'"
            "(?i)(^\s*FilePath64\s*=\s*)(.*)" = "`$1'$($Latest.FileName64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "win-acme" -Repository "win-acme"
	
    $match32 = "win-acme.*\.x86\.pluggable\.zip"
    $match64 = "win-acme.*\.x64\.pluggable\.zip"
    
    $url32      = 'https://github.com' + ($download_page.links | ? href -match $match32 | Select-Object -First 1 -ExpandProperty href)
	$url64      = 'https://github.com' + ($download_page.links | ? href -match $match64 | Select-Object -First 1 -ExpandProperty href)
    
	$version    = ($url32 -split '/' | select -Last 1 -Skip 1).trim("v")
    
	return @{ Version = $version; URL32 = $url32; URL64 = $url64 }
}

Update-Package -ChecksumFor none