Import-Module AU
Import-Module Wormies-AU-Helpers

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*FileFullPath64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"          
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri 'https://github.com/PCSX2/pcsx2/releases' -UseBasicParsing
	$regex32        = "pcsx2-v[\d\.]*-windows-32bit-SSE4.7z"
    $regex64        = "pcsx2-v[\d\.]*-windows-64bit-SSE4.7z"
    $url32          = 'https://github.com' + ($download_page.links | ? href -match $regex32 | select -First 1 -expand href)
    $url64          = 'https://github.com' + ($download_page.links | ? href -match $regex64 | select -First 1 -expand href)
	
	$version   = ($url32 -split "/" | select -Last 1 -Skip 1).trim("v") + '-dev'
	
	return @{ Version = $version; URL32 = $url32; FileType = "7z"; URL64 = $url64 }
}

Update-Package -ChecksumFor none
