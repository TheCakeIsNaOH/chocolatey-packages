Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            '(?i)(^\s*\$filelocation\s*=\s*)(.*)' = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }  
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
	$download_page = Get-GitHubLatestReleaseLinks -User "maharmstone" -Repository "btrfs"
	
	$url        = $download_page.links | ? href -match 'btrfs-\d\.\d[\d\.]*\.zip$' | % href | select -First 1
	$version    = ($url -split '[/]' | select -Last 1 -Skip 1).substring(1)
    $modurl     = 'https://github.com' + $url 

	return @{ Version = $version; URL32 = $modurl; PackageName = 'winbtrfs'}
}

Update-Package -ChecksumFor none