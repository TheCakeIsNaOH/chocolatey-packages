Import-Module Chocolatey-AU
#. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*FileFullPath64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
        ".\tools\chocolateyuninstall.ps1" = @{
            "(?i)(^\s*FileFullPath64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
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
    #$download_page = Get-GitHubLatestReleaseLinks -User "kiwix" -Repository "kiwix-desktop"
	#$sourceZipUrl = $download_page.Links | Where-Object href -Like "*.zip" | Select-Object -ExpandProperty href -First 1
    #$version = ($sourceZipUrl -split "/" | Select-Object -Last 1).trim(".zip")
    
    $releases = 'https://download.kiwix.org/release/kiwix-desktop/'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regex64       = 'kiwix-desktop_windows_x64_[\d\.]+.zip'
    $url64         = $download_page.links | ? href -match $regex64 | select -Last 1 -expand href
    $version       = ($url64 -split '[_]' | Select-Object -Last 1).trim(".zip")
    $url64         = $releases + $url64 

	return @{ Version = $version; URL64 = $URL64 }
}

Update-Package -ChecksumFor none