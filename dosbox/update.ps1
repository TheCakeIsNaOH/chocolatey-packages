Import-Module au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
        }
    }
}
function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri https://sourceforge.net/projects/dosbox/files/dosbox/ -UseBasicParsing
	$folder        = "https://sourceforge.net" + ($download_page.Links | ? href -match "\d\.\d\d" | select -expand href -first 1)
	$version       = $folder -split '/' | select -Last 1 -skip 1
	$url32         = $folder + 'DOSBox' + $version + '-win32-installer.exe/download'
	$mod_version   = $version.replace('-','.')
	
	$useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome
    return @{
        URL32        = "$url32";
        Version      = $mod_version;
		FileType     = 'exe';
		PackageName  = 'dosbox';
		Options      = @{ Headers = @{ 'User-Agent' = $useragent } }
    }
}


Update-Package -ChecksumFor none -nocheckurl