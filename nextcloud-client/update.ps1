Import-Module AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

$releases = 'https://github.com/nextcloud/desktop/releases'

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }        
    }
}

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "nextcloud" -Repository "desktop"
    
    $url64         = $download_page.links | ? href -match 'x64\.msi$'| % href | select -first 1
    $url32         = $download_page.links | ? href -match 'x86\.msi$'| % href | select -first 1
    $version       = ($url64 -split '/' | select -Last 1 -Skip 1).trim('v')
    
    $useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
    
    return @{   
        Version = $version; 
        URL32 = 'https://github.com' + $url32
        URL64 = 'https://github.com' + $url64
        Options = @{ Headers = @{ 'User-Agent' = $useragent } };
    }
}

Update-Package -ChecksumFor none