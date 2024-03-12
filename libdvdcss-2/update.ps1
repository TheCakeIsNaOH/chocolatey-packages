Import-Module Chocolatey-AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

$releases = 'https://github.com/allienx/libdvdcss-dll/releases'

function global:au_GetLatest {
    $page    = Get-GitHubLatestReleaseLinks -User "allienx" -Repository "libdvdcss-dll"
    $url32   =  $page.links | ? { $_.href -match '\.zip$' } | Select-Object -First 1 -ExpandProperty href
    $version = ($url32 -split '/' | select -Last 1 -Skip 1).Replace('v','')

    @{
        URL32      = 'https://github.com' + $url32
        Version    = $version
        
    }
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(checksumDll32:).*"        = "`${1} $($Latest.ChecksumDll32)"
            "(?i)(checksumDll64:).*"        = "`${1} $($Latest.ChecksumDll64)"
        }
    }
}

function global:au_BeforeUpdate {
    Remove-Item "tools\*.zip" -Recurse
    Remove-Item "tools\*.dll" -Recurse
    Remove-Item "tools\32-bit" -Recurse -ea 0
    Remove-Item "tools\64-bit" -Recurse -ea 0
    
    Get-RemoteFiles -Purge -NoSuffix

    Expand-Archive -Path (".\tools\" + $Latest.FileName32) -DestinationPath "tools" -Force
    Remove-Item "tools\*.zip" -Recurse

    (Get-ChildItem -Directory -Recurse -Path "tools\dist" -Filter "32-bit").fullname | Move-Item -Destination ".\tools\" -Force
    (Get-ChildItem -Directory -Recurse -Path "tools\dist" -Filter "64-bit").fullname | Move-Item -Destination ".\tools\" -Force
    
    Remove-Item "tools\dist" -Recurse

    $Latest.ChecksumDLL32 = Get-Childitem -Path 'tools\32-bit' -Filter "*.dll" | Get-FileHash | Select-Object -ExpandProperty hash
    $Latest.ChecksumDLL64 = Get-Childitem -Path 'tools\64-bit' -Filter "*.dll" | Get-FileHash | Select-Object -ExpandProperty hash

}

Update-Package -ChecksumFor none