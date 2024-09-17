Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
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
	$download_page = Invoke-WebRequest -Uri https://dolphin-emu.org/download/ -UseBasicParsing
    #https://dl.dolphin-emu.org/releases/2409/dolphin-2409-x64.7z
	$regex         = 'dolphin-\d+-x64.7z'
    $url64         = $download_page.links | ? href -match $regex | select -First 1 -expand href
	
	$verNum        = $url64 -split '[-]' | select -Last 1 -Skip 1
	$version       = $verNum.ToString() + ".0.0"
	
	return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor none

#https://dolphin-emu.org/update/check/v1/beta/31524288e3b2450eaefff8202c6d26c4ba3f7333/win