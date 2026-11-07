Import-Module Chocolatey-AU

function global:au_GetLatest {
    $updateInfo = Invoke-WebRequest -Uri 'https://codesector.com/updates/teracopy.txt' -UseBasicParsing

    $version  = ($updateInfo.Content -split "`n" | Select-String '^\s*ProductVersion\s*=\s*(.+)$').Matches[0].Groups[1].Value.Trim()
    $url      = ($updateInfo.Content -split "`n" | Select-String '^\s*URL\s*=\s*(.+)$').Matches[0].Groups[1].Value.Trim()
    $checksum = ($updateInfo.Content -split "`n" | Select-String '^\s*SHA256\s*=\s*(.+)$').Matches[0].Groups[1].Value.Trim()

    return @{
        PackageName = 'teracopy'
        Version     = $version
        URL32       = $url
        Checksum32  = $checksum
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

Update-Package -ChecksumFor none
