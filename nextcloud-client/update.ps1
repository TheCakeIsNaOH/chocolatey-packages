Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }        
    }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "nextcloud-releases" -Repository "desktop"
    
    $url64         = $download_page.links | ? href -match 'x64\.msi$'| % href | select -first 1
    $version       = ($url64 -split '/' | select -Last 1 -Skip 1).trim('v')
    
    $useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
    
    return @{   
        Version = $version; 
        URL64 = 'https://github.com' + $url64
        Options = @{ Headers = @{ 'User-Agent' = $useragent } };
    }
}

Update-Package -ChecksumFor none