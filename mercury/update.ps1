Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "Alex313031" -Repository "Mercury"
	
    $url64 = $download_page.links | ? { $_.href -match 'AVX2_installer.exe$' } | select -expand href -First 1
    $version = ($url64 -split '/' | select -Last 1 -Skip 1).trim("v.")

    @{
        URL64      = "https://github.com" + $url64
        Version    = $version
    }
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }   
    }
}

function global:au_BeforeUpdate {
     Get-RemoteFiles -Purge
}

Update-Package -ChecksumFor none