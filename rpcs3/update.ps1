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
	$OSVersion = "10.0.26200.0"
    $OSArch = "x64"
    $OSType = "windows"
    $OldVersionHash = "0ee3e24b"
    $updateAPIPage = "https://update.rpcs3.net/?api=v3&c=" + $OldVersionHash + "&os_type=" + $OSType + "&os_arch=" + $OSArch + "&os_version=" + $OSVersion

    $apiResponse = Invoke-RestMethod -Method Get -UseBasicParsing -Uri $updateAPIPage

    #$download_page = Invoke-WebRequest -Uri "https://rpcs3.net/download" -UseBasicParsing
    #$regex64       = '.*\.7z'
	#$url64         = $download_page.links | ? href -match $regex64 | select -First 1 -expand href 

    $apiVersion = $apiResponse.latest_build.version
	$majorVersion  = ($apiVersion -split '[-]' | select -Last 1 -Skip 1)
    $buildNumber   = $apiVersion -split '[-]' | select -Last 1
	$version       = $majorVersion + '-alpha' + $buildNumber
    
    $url64 = $apiResponse.latest_build.windows.download
    
	return @{ Version = $version; URL64 = $url64; }
}

Update-Package -ChecksumFor none