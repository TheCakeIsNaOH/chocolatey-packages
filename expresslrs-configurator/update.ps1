Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }        
    }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.Url
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "ExpressLRS" -Repository "ExpressLRS-Configurator"
    
    $url         = $download_page.links | ? href -match '\.exe$'| % href | select -first 1
    $version       = ($url -split '/' | select -Last 1 -Skip 1).trim('v')
    
    $useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
    
    return @{   
        Version = $version; 
        URL = 'https://github.com' + $url
        Options = @{ Headers = @{ 'User-Agent' = $useragent } };
    }
}

Update-Package -ChecksumFor none