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
  #$releaseNotesUrl = 'https://www.diskpart.com/changelog.html'
  #$downloadPage    = 'https://www.aomeitech.com/pa/standard.html'
  
  #$release_page    = Invoke-WebRequest -Uri $releaseNotesUrl -UseBasicParsing
  #$version         = $release_page.links | % {
  #    $_.outerHTML -split "<|>" | Where-Object { $_ -match '^\d\d\.' } | select-object -First 1
  #} | select-object -First 1
  
  #$download_page    = Invoke-WebRequest -Uri $downloadPage -UseBasicParsing
  #$url32            = $download_page.links | Where-Object href -match ".exe" | Select-Object -First 1
  
  $upgradeINIUrl = "http://www2.aomeisoftware.com/download/Autoupgrade/PAaotoupgrade/PAupgrade.ini"
  $upgradeINI = ((New-Object System.Net.WebClient).DownloadString($upgradeINIUrl))
  $majorVersion = ($upgradeINI -split "\n" | Select-String "maj" | select -First 1).tostring().split("=") | Select-Object -Last 1
  $minorVersion = ($upgradeINI -split "\n" | Select-String "min" | select -First 1).tostring().split("=") | Select-Object -Last 1
  $patchVersion = ($upgradeINI -split "\n" | Select-String "thrid" | select -First 1).tostring().split("=") | Select-Object -Last 1
  $version = $majorVersion + "." + $minorVersion + "." + $patchVersion
  
  $url32 = 'https://www.aomeitech.com/ss/download/pa/PAssist_Std.exe'

  @{
	PackageName     = 'partition-assistant-standard'
    Version         = $version
    URL32           = $url32
  }
}

Update-Package -ChecksumFor none