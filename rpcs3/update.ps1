Import-Module AU

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
	$download_page = Invoke-WebRequest -Uri "https://rpcs3.net/download" -UseBasicParsing
	
	$regex64       = '.*\.7z'
	$url64         = $download_page.links | ? href -match $regex64 | select -First 1 -expand href 
	$majorVersion  = ($url64 -split '[-]' | select -Last 1 -Skip 2).trim('v')
    $buildNumber   = $url64 -split '[-]' | select -Last 1 -Skip 1
    
	$version       = $majorVersion + '-alpha' + $buildNumber
    
	return @{ Version = $version; URL64 = $url64; }
}

Update-Package -ChecksumFor none