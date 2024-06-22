Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

$x64Filename = 'yt-dlp.exe'
$x32Filename = 'yt-dlp_x86.exe'
$baseDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
	}
}

function global:au_BeforeUpdate() {
    $toolsDir = Join-Path $baseDir 'tools'
    $x64Dir = Join-Path $toolsDir 'x64'
    $x86Dir = Join-Path $toolsDir 'x86'
    
    New-Item -ItemType Directory -Path $x64Dir -EA 0 | Out-Null
    New-Item -ItemType Directory -Path $x86Dir -EA 0 | Out-Null
    
	Get-RemoteFiles -Purge -NoSuffix

    Move-Item -Force -Path (Join-Path $toolsDir $x32Filename) -Destination ([io.path]::Combine($x86Dir, 'yt-dlp.exe'))
    Move-Item -Force -Path (Join-Path $toolsDir $x64Filename) -Destination ([io.path]::Combine($x64Dir, 'yt-dlp.exe'))
}


function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "yt-dlp" -Repository "yt-dlp"

    $url64      = $download_page.links | ? href -match $x64Filename | % href | select -First 1
    $url32      = $download_page.links | ? href -match $x32Filename | % href | select -First 1
    $version    = $url64 -split '/' | select -Last 1 -Skip 1
    $modurl32   = 'https://github.com' + $url32 
    $modurl64   = 'https://github.com' + $url64

    $nightly_download_page = Get-GitHubLatestReleaseLinks -User "yt-dlp" -Repository "yt-dlp-nightly-builds"

    $nightly_url64      = $nightly_download_page.links | ? href -match $x64Filename | % href | select -First 1
    $nightly_url32      = $nightly_download_page.links | ? href -match $x32Filename | % href | select -First 1
    $nightly_version    = ($nightly_url64 -split '/' | select -Last 1 -Skip 1).ToString() + "-nightly"
    $nightly_modurl32   = 'https://github.com' + $nightly_url32 
    $nightly_modurl64   = 'https://github.com' + $nightly_url64

    return @{ 
        Streams = [ordered] @{
            'stable' = @{ 
                Version = $version; 
                URL32   = $modurl32;
                URL64   = $modurl64;
                Title = "YT-DLP"
                }
            'nightly' = @{
                Version = $nightly_version; 
                URL32   = $nightly_modurl32;
                URL64   = $nightly_modurl64;
                Title = "YT-DLP (Nightly)"
            }
        }
    }
}

Update-Package -ChecksumFor none