import-module au

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
	  "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }	
  }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_GetLatest {
  $latest_changelog  = 'http://updates.macrium.com/reflect/v7/latest_release_notes.asp'
  $download_page     = Invoke-WebRequest -Uri $latest_changelog -UseBasicParsing -Method Head
  
  $current_changelog = ($download_page.BaseResponse.ResponseUri.AbsoluteUri) + ($download_page.BaseResponse.RequestMessage.RequestUri.AbsoluteUri)
  
  $version           = ($current_changelog.tostring() -split '/' | select -Last 1 -Skip 1).trimstart('v')

  @{
	PackageName     = 'reflect-free'
    Version         = "$version"
    URL32           = 'https://updates.macrium.com/reflect/v7/ReflectDLHF.exe'
  }
}

Update-Package  -ChecksumFor none -nocheckchocoversion