Import-Module AU
Import-Module Wormies-AU-Helpers
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\s*\$avx2_Qt\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.filename_avx2_qt)'"
            '(?i)(^\s*\$avx2_wxWidgets\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.filename_avx2_wxwidgets)'"
            '(?i)(^\s*\$SSE4_Qt\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.filename_sse4_qt)'"
            '(?i)(^\s*\$SSE4_wxWidgets\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.filename_sse4_wxwidgets)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+AVX2_Qt:).*"            = "`${1} $($Latest.url_avx2_qt)"
            "(?i)(\s+AVX2_wxWidgets:).*"     = "`${1} $($Latest.url_avx2_wxwidgets)"
            "(?i)(\s+SSE4_Qt:).*"            = "`${1} $($Latest.url_sse4_qt)"
            "(?i)(\s+SSE4_wxWidgets:).*"     = "`${1} $($Latest.url_sse4_wxwidgets)"
            "(?i)(checksum_AVX2_Qt:).*"         = "`${1} $($Latest.checksum_avx2_qt)"
            "(?i)(checksum_AVX2_wxWidgets:).*"  = "`${1} $($Latest.checksum_avx2_wxWidgets)"
            "(?i)(checksum_SSE4_Qt:).*"         = "`${1} $($Latest.checksum_SSE4_qt)"
            "(?i)(checksum_SSE4_wxWidgets:).*"  = "`${1} $($Latest.checksum_SSE4_wxWidgets)"
        }
	}
}

function global:au_BeforeUpdate {
    $Latest.URL64 = $Latest.url_avx2_qt  
    Get-RemoteFiles -Purge -NoSuffix
    $Latest.filename_avx2_qt = $Latest.Filename64
    $Latest.checksum_avx2_qt = $Latest.Checksum64
    
    $Latest.URL64 = $Latest.url_avx2_wxwidgets
    Get-RemoteFiles -NoSuffix
    $Latest.filename_avx2_wxwidgets = $Latest.Filename64
    $Latest.checksum_avx2_wxwidgets = $Latest.Checksum64
    
    $Latest.URL64 = $Latest.url_sse4_qt 
    Get-RemoteFiles -NoSuffix
    $Latest.filename_sse4_qt = $Latest.Filename64
    $Latest.checksum_sse4_qt = $Latest.Checksum64
    
    $Latest.URL64 = $Latest.url_sse4_wxwidgets
    Get-RemoteFiles -NoSuffix
    $Latest.filename_sse4_wxwidgets = $Latest.Filename64
    $Latest.checksum_sse4_wxwidgets = $Latest.Checksum64
    
}

function global:au_GetLatest {
	$download_page = Get-GitHubLatestReleaseLinks -User "PCSX2" -Repository "pcsx2" -AbsoluteLatestRelease
    
    $regex_avx2_qt = "pcsx2-v[\d\.]*-windows-64bit-AVX2-Qt.7z"
    $url_avx2_qt   = 'https://github.com' + ($download_page.links | ? href -match $regex_avx2_qt | select -First 1 -expand href)
    
    $regex_avx2_wxWidgets  = "pcsx2-v[\d\.]*-windows-64bit-AVX2-wxWidgets.7z"
    $url_avx2_wxWidgets   = 'https://github.com' + ($download_page.links | ? href -match $regex_avx2_wxWidgets | select -First 1 -expand href)
   
    $regex_sse4_qt = "pcsx2-v[\d\.]*-windows-64bit-sse4-Qt.7z"
    $url_sse4_qt   = 'https://github.com' + ($download_page.links | ? href -match $regex_sse4_qt | select -First 1 -expand href)
    
    $regex_sse4_wxWidgets  = "pcsx2-v[\d\.]*-windows-64bit-sse4-wxWidgets.7z"
    $url_sse4_wxWidgets   = 'https://github.com' + ($download_page.links | ? href -match $regex_sse4_wxWidgets | select -First 1 -expand href)
	
	$version   = ($url_avx2_qt -split "/" | select -Last 1 -Skip 1).trim("v") + '-dev'
	
	return @{ 
        Version = $version
        FileType = "7z"
        url_avx2_qt = $url_avx2_qt
        url_avx2_wxWidgets = $url_avx2_wxWidgets
        url_sse4_qt = $url_sse4_qt
        url_sse4_wxWidgets = $url_sse4_wxWidgets
    }
}

Update-Package -ChecksumFor none
