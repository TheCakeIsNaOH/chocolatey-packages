Import-Module AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

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
    $download_page = Get-GitHubLatestReleaseLinks -User "angryip" -Repository "ipscan"
	
    $regex      = 'ipscan-\d\.\d[\d\.]*-setup.exe$'
    $url        = $download_page.links | ? href -match $regex | % href | select -First 1
    $modurl     = 'https://github.com' + $url 
    
    $version    = ($url -split '[/]' | select -Last 1 -Skip 1)

    return @{ Version = $version; URL32 = $modurl}
}

Update-Package -ChecksumFor none -NoReadme
