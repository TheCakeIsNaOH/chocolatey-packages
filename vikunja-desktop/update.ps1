Import-Module Chocolatey-AU

$releases = 'https://dl.vikunja.io/desktop'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
	}
}

function global:au_BeforeUpdate {
	$Latest.Filename32 = $Latest.Filename32 -replace '%20','-'
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
	$releases_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$regexReleases = '\d\.\d\d'
	$download_url  = 'https://dl.vikunja.io/' + ($releases_page.links | ? href -match $regexReleases | select -First 1 -Expand href).tostring()
    
    $download_page = Invoke-WebRequest -Uri $download_url -UseBasicParsing
    $regexDownload = 'Vikunja.*exe$'
    $url32         = 'https://dl.vikunja.io/' + ($download_page.links | ? href -match $regexDownload | Select -expand href).tostring()
    
    $version       = $download_url -split "/" | select -Last 1

	return @{ Version = $version; URL32 = $url32; }
}

Update-Package -ChecksumFor none