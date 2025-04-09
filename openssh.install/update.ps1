Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File\s*=\s*)(.*)"   = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "PowerShell" -Repository "Win32-OpenSSH"
	
    $match32 = "Win32.*\.msi$"
    $match64 = "Win64.*\.msi$"
    $url32   = 'https://github.com' + ($download_page.links | ? href -match $match32 | Select-Object -First 1 -ExpandProperty href)
    $url64   = 'https://github.com' + ($download_page.links | ? href -match $match64 | Select-Object -First 1 -ExpandProperty href)
    
	$version = (($url32 -split '/' | Select-Object -Last 1 -Skip 1).trim("v") -replace "p1","") -replace "p2",""
    
	return @{ Version = $version; URL32 = $url32; URL64 = $url64 }
}

Update-Package -ChecksumFor none