Import-Module au

function global:au_SearchReplace {
  @{ 
    "tools\chocolateyinstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }	
  }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_GetLatest {
  $releaseNotesUrl = 'https://www.redfox.bz/download/changes_anydvd.txt'
  $baseDownloadUrl = 'https://www.redfox.bz/download/SetupAnyDVD'
  $downloadPage    = 'https://www.redfox.bz/download.html'
  
  $download_page   = Invoke-WebRequest -Uri $downloadPage -UseBasicParsing
  $re              = "anydvd.*\.exe"
  $link32          = $download_page.links | Where-Object href -match $re | Select-Object -First 1
  $url32           = $link32.href
  $version         = $link32.title -split " " | Where-Object { $_ -match "\d\." } | select -First 1

  @{
	PackageName     = 'anydvd'
    Version         = $version
    URL32           = $url32
  }
}

Update-Package -ChecksumFor none