Import-Module AU

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }        
    }
}

function global:au_BeforeUpdate() {
    $nameBase = "HexChat-$($Latest.Version)"
    Get-RemoteFiles -Purge -FileNameBase $nameBase
}

function global:au_GetLatest {
    $downloadpage  = 'https://hexchat.github.io/downloads.html'
    
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $downloadpage
    $re64 = "x64.exe"
    $url64         = $download_page.links | ? href -match $re64 | % href | select -first 1
    $re32 = "x86.exe"
    $url32         = $download_page.links | ? href -match $re32 | % href | select -first 1
    $version       = ($url64 -split '/' | Select-Object -Last 1 -Skip 1).trim("v")
    
    $useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
    
    return @{   
        Version = $version; 
        URL32 = $url32
        URL64 = $url64
        Options = @{ Headers = @{ 'User-Agent' = $useragent } };
    }
}

Update-Package -ChecksumFor none