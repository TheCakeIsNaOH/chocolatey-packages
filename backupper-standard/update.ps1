import-module chocolatey-au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}


function global:au_GetLatest {
    $release = Invoke-WebRequest -UseBasicParsing -Uri 'https://www.ubackup.com/download.html'
    $version = $release.AllElements `
        | Where-Object { $_.tagName -eq 'DIV' -and $_.innerText -like '?.?.?' } `
        | Select-Object -ExpandProperty innerHTML
    $version="8.5.1"

    $url = 'https://www.aomeiget.com/download/adb/AOMEIBackupperStd.exe'

    @{
        URL32   = $url
        Version = $version
    }
}

Update-Package -ChecksumFor none