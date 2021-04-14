Import-Module AU
Import-Module Wormies-AU-Helpers

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase "pcsx2-$($latest.version)"
}

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://buildbot.orphis.net/pcsx2/index.php -UseBasicParsing
	$regex         = "/pcsx2/index.php\?.*rev.*windows"
    $relUrl        = ($download_page.links | ? href -match $regex | select -First 1 -expand href).replace('&amp;', "&")
    $url           = ("https://buildbot.orphis.net" + $relUrl)
	
	$version   = ($relUrl -split "[=&]" | select -Last 1 -Skip 2).trim("v")
    #$version       = ($fullversion -split "-" | select -First 3) -join "-"
	
	return @{ Version = $version; URL32 = $url; FileType = "7z" }
}

Update-Package -ChecksumFor none
