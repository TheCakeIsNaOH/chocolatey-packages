Import-Module AU

function global:au_GetLatest {
    $downloads_page = Invoke-WebRequest -Uri 'https://looking-glass.io/downloads' -UseBasicParsing
    
    $beta_url = 'https://looking-glass.io' + ($downloads_page.links | Where-Object href -match "/artifact/B\d/host" | Select-Object -First 1 -ExpandProperty href)
    $beta_version = "0.0.0.0-" + ($beta_url -split '/' | Select-Object -Last 1 -Skip 1) + "Final"
    
    $beta_rc_url = 'https://looking-glass.io' + ($downloads_page.links | Where-Object href -match "/artifact/B[\d\.]+-RC\d/host" | Select-Object -First 1 -ExpandProperty href)
    $beta_rc_version = "0.0.0.0-" + ($beta_rc_url -split '/' | Select-Object -Last 1 -Skip 1)
    
    $bleeding_edge_url = 'https://looking-glass.io' + ($downloads_page.links | Where-Object href -match "/artifact/B\d-[rc\-\w]{2,7}-\w{8}/host" | Select-Object -First 1 -ExpandProperty href)
    $bleeding_edge_version = "0.0.0.0-" + ($bleeding_edge_url -split '/' | Select-Object -Last 1 -Skip 1)
    if ($bleeding_edge_version -like "*-rc*") { $bleeding_edge_version = $bleeding_edge_version -replace "-rc", "" }
    
    return @{   
                Streams = [ordered] @{
                        'Beta' = @{ 
                            Version = $beta_version; 
                            URL64 = $beta_url; 
                            FileType = 'zip';
                            PackageName = 'looking-glass-host';
                            Title = "Looking Glass (Host)"
                            }
                        'Beta-RC' = @{
                            Version = $beta_rc_version; 
                            URL64 = $beta_rc_url; 
                            FileType = 'zip';
                            PackageName = 'looking-glass-host';
                            Title = "Looking Glass (Host)"
                        }
                        'Bleeding-Edge' = @{
                            Version = $bleeding_edge_version
                            URL64 = $bleeding_edge_url
                            FileType = 'zip';
                            PackageName = 'looking-glass-host-bleeding-edge';
                            Title = "Looking Glass (Host Bleeding-Edge)"
                        }
                }
            }
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
        ".\looking-glass-host.nuspec"  = @{
            "(?i)(^\s*\<title\>).*(\<\/title\>)" = "`${1}$($Latest.Title)`${2}"
        }
    }
}

function global:au_BeforeUpdate() {
    Remove-Item (Join-Path "tools" "*.exe")

    Get-RemoteFiles -Purge -NoSuffix -FileNameBase "looking-glass-host"
    
    $archive = Join-Path "tools" "looking-glass-host.zip"

    Expand-Archive -Path $archive -DestinationPath "tools" -Force

    Remove-Item $archive
    Remove-Item (Join-Path 'tools' 'build.log')
    
    $filepath = Get-Childitem -Path 'tools' -Filter "*.exe"
    
    $Latest.Checksum64 = $filepath | Get-FileHash | Select-Object -ExpandProperty hash
    $Latest.Filename64 = $filepath.Name
}

Update-Package -ChecksumFor none

