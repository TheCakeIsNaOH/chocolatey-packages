Import-Module AU

$releases    = 'https://github.com/yt-dlp/yt-dlp/releases'
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
    
	Get-RemoteFiles -Purge -NoSuffix
    Move-Item -Force -Path (Join-Path $toolsDir $x32Filename) -Destination ([io.path]::Combine($toolsDir, 'x86', 'yt-dlp.exe'))
    Move-Item -Force -Path (Join-Path $toolsDir $x64Filename) -Destination ([io.path]::Combine($toolsDir, 'x64', 'yt-dlp.exe'))
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
	$url64      = $download_page.links | ? href -match $x64Filename | % href | select -First 1
    $url32      = $download_page.links | ? href -match $x32Filename | % href | select -First 1
	$version    = $url64 -split '/' | select -Last 1 -Skip 1
	$modurl32   = 'https://github.com' + $url32 
    $modurl64   = 'https://github.com' + $url64
	
	return @{ 
        Version = $version; 
        URL32   = $modurl32;
        URL64   = $modurl64;
    }
}

Update-Package -ChecksumFor none