Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://support.logitech.com/software/options -UseBasicParsing
	
	#$regex32       = '4kslideshowmaker_[\d\.]*\.msi'
	#$url32         = $download_page.links | ? href -match $regex32 | select -First 1 -expand href 
    $url32         = "https://download01.logi.com/web/ftp/pub/techsupport/options/options_installer.exe"
    
	
	$version       = "10.26.14"

	
	return @{ Version = $version; URL32 = $url32; }
}

Update-Package -ChecksumFor none