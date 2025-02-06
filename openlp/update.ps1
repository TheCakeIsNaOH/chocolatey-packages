Import-Module Chocolatey-AU

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyinstall.ps1" = @{
			"(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $mainPage   = Invoke-WebRequest -Uri https://get.openlp.org/ -UseBasicParsing
    $version    = ($mainPage.links | ? href -match "^\d\.\d" | select -Last 1 -ExpandProperty href).trim('/')
    $versionURL = 'https://get.openlp.org/' + $version + '/'
    
    $versionPage = Invoke-WebRequest -Uri ($versionURL) -UseBasicParsing
    $url64end    = $versionPage.links | ? href -match "x64.msi$" | select -ExpandProperty href
    $url64       = $versionURL + $url64end 
    
    $version = (Get-Version $version).tostring()
    
    # Appears to no longer have odd middle versions be pre-release
    #$middleVersion = $version -split "\." | select -First 1 -Skip 1
    #if ((($middleVersion % 2) -eq 1) -and ($version -notlike "*-*")) {
    #    $version += "-pre"
    #}
    
    return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor none
