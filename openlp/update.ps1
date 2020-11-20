Import-Module AU

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*File\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*File64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $mainPage   = Invoke-WebRequest -Uri https://get.openlp.org/ -UseBasicParsing
    $version    = ($mainPage.links | ? href -match "\d\.\d" | select -Last 1 -ExpandProperty href).trim('/')
    $versionURL = 'https://get.openlp.org/' + $version + '/'
    
    $versionPage = Invoke-WebRequest -Uri ($versionURL) -UseBasicParsing
    $url64end    = $versionPage.links | ? href -match "x64.msi" | select -ExpandProperty href
    $url32end    = $versionPage.links | ? href -match "$version.msi" | select -ExpandProperty href 
    $url64       = $versionURL + $url64end 
    $url32       = $versionURL + $url32end
    
    $middleVersion = $version -split "\." | select -First 1 -Skip 1
    if (($middleVersion % 2) -eq 1) {
        $version += "-alpha"
    }
    
    return @{ Version = $version; URL32 = $url32; URL64 = $url64 }
}

Update-Package -ChecksumFor none
