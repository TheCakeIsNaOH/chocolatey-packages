Import-Module AU

$releases = 'https://windows-2048.github.io/The-Fastest-Mouse-Clicker-for-Windows/'

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }    
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
	$url32      = $download_page.links | ? href -match "TheFastestMouseClicker_[\d\.]+\.exe" | select -first 1 -ExpandProperty href
    $version    = ($url32 -split '_' | select -Last 1).trim(".exe")

	$useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome
	return @{ 
		Version = $version; 
		URL32 = $url32; 
		PackageName = 'fastest-mouse-clicker'; 
		FileType = 'exe';
		Options = @{ Headers = @{ 'User-Agent' = $useragent } }
    }
}

Update-Package -ChecksumFor none -nocheckurl