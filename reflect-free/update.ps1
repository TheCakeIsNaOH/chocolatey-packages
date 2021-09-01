Import-Module au

function global:au_SearchReplace {
  @{ 
    "tools\chocolateyinstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }	
  }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
  $latest_changelog  = 'http://updates.macrium.com/reflect/v8/latest_release_notes.asp'
  $download_page     = Invoke-WebRequest -Uri $latest_changelog -UseBasicParsing -Method Head
  $current_changelog = ($download_page.BaseResponse.ResponseUri.AbsoluteUri) #+ ($download_page.BaseResponse.RequestMessage.RequestUri.AbsoluteUri)
  $version           = ($current_changelog.tostring() -split '/' | select -Last 1 -Skip 1).trimstart('v')
  
  $url32             = 'https://download.macrium.com/reflect/v8/v' + $version + '/reflect_setup_free_x86.exe'
  $url64             = 'https://download.macrium.com/reflect/v8/v' + $version + '/reflect_setup_free_x64.exe'

#https://download.macrium.com/reflect/v8/v8.0.5928/reflect_setup_free_x86.exe
#https://download.macrium.com/reflect/v8/v8.0.5928/reflect_setup_free_x64.exe

  @{
	PackageName     = 'reflect-free'
    Version         = "$version"
    URL32           = $url32
    URL64           = $url64
  }
}

Update-Package -ChecksumFor none