Import-Module AU


function global:au_SearchReplace {
    @{
        "tools\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        "$($Latest.PackageName).nuspec" = @{
            "(\<docsUrl\>).*?(\</docsUrl\>)" = "`${1}$($Latest.docsUrl)`$2"
        }        
    }
}

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge
}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://github.com/nextcloud/desktop/releases' -UseBasicParsing
    
    $url64         = $download_page.links | ? href -match 'x64\.msi$'| % href | select -first 1
    $url32         = $download_page.links | ? href -match 'x86\.msi$'| % href | select -first 1
    $version       = ($url64 -split '/' | select -Last 1 -Skip 1).trim('v')
    
    $docsUrlPrefix = "https://docs.nextcloud.com/desktop/"
    $partVersion   = ($version -split '\.' | select -First 2) -join "."
    $docsUrl       = $docsUrlPrefix + $partVersion
    
    #If pre-release, use base docs URL because there is not a specific version live yet.
    if ($version -like '*-*') {
        $docsUrl = "https://docs.nextcloud.com/"
    }
    
    $useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
    
    return @{   
        Version = $version; 
        URL32 = 'https://github.com' + $url32
        URL64 = 'https://github.com' + $url64
        Options = @{ Headers = @{ 'User-Agent' = $useragent } };
        docsUrl = $docsUrl
    }
}

Update-Package -ChecksumFor none