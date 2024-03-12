Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\s*\$file\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }  
	}
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri https://download.wsusoffline.net/ -UseBasicParsing
	$regex         = 'wsusoffline\d\d+\.zip'
    $url32         = $download_page.links | ? href -match $regex | select -First 1 -expand href
	$no_dots       = ($url32 -split "\." | select -Last 1 -Skip 1) -split "[a-z]" | select -Last 1
	$version       = $no_dots.Insert(2,".").Insert(4, ".").trim(".") 
	
    return @{
        URL32        = "$url32"
        Version      = $version
		FileType     = 'zip'
		PackageName  = 'wsus-offline-update'
    }
}

Update-Package -ChecksumFor none