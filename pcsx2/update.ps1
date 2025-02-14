Import-Module Chocolatey-AU
Import-Module Wormies-AU-Helpers
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        "pcsx2.nuspec" = @{
            "(\<dependency .+?`"pcsx2.install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
	}
}

function global:au_GetLatest {
	$download_page = Get-GitHubLatestReleaseLinks -User "PCSX2" -Repository "pcsx2"
    
    $regex64 = "pcsx2-v[\d\.]*-windows-x64-installer.exe"
    $url64   = 'https://github.com' + ($download_page.links | ? href -match $regex64 | select -First 1 -expand href)

	$version   = ($url64 -split "/" | select -Last 1 -Skip 1).trim("v")
	return @{ 
        Version = $version
        FileType = "exe"
        url64 = $url64
    }
}

Update-Package -ChecksumFor none
