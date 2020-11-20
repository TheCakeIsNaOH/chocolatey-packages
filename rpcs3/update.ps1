Import-Module AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://rpcs3.net/download -UseBasicParsing
	
	$regex32       = '.*\.7z'
	$url32         = $download_page.links | ? href -match $regex32 | select -First 1 -expand href 
	$majorVersion  = ($url32 -split '[-]' | select -Last 1 -Skip 2).trim('v')
    $buildNumber   = $url32 -split '[-]' | select -Last 1 -Skip 1
    
	$version       = $majorVersion + '-alpha' + $buildNumber
    
	return @{ Version = $version; URL32 = $url32; }
}

Update-Package -ChecksumFor none