Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri https://www.4kdownload.com/downloads/34 -UseBasicParsing
    $regex64       = '4kslideshowmaker_.*_x64.msi'
    $url64         = $download_page.links | ? href -match $regex64 | select -First 1 -expand href
    $version       = $url64 -split '[_]' | select -Last 1 -Skip 1
    $modurl64      = $url64 -replace 'website', 'chocolatey'
    return @{ Version = $version; URL64 = $modurl64 }
}

Update-Package -ChecksumFor none