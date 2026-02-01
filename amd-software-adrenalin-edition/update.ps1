Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_BeforeUpdate {
    $Headers = @{ 
      "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
      Accept  = '*/*'
      Referer = 'https://www.amd.com/en/support/download/drivers.html' 
    }

    $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.URL64 -Headers $headers
}

function global:au_AfterUpdate {
  Update-Metadata -key 'releaseNotes' -value $Latest.ReleaseNotes
}

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri "https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-9000-series/amd-radeon-rx-9070-xt.html" -UseBasicParsing
    $bUrl          = $download_page.Links | Where-Object href -like "*.exe" | Where-Object href -notlike "*minimal*" | Select-Object -ExpandProperty href -First 1
    #$combinedUrl   = $bUrl -Replace "-b.exe","-c.exe"
    $bName         = $bUrl -split '/' | Select-Object -Last 1
    $hasWHQL       = $bName.StartsWith("whql")
    $versionSplit  = Get-Version $bName
    $version       = ($versionSplit).Version.ToString()
    $releaseNotesUrl = "https://www.amd.com" + ($download_page.Links | Where-Object href -like "*RN-RAD-WIN*" | Select-Object -ExpandProperty href -First 1)
    
    
    $releasenotes_page = Invoke-WebRequest -Uri $releaseNotesUrl -UseBasicParsing
    $combinedUrl   = $releasenotes_page.Links | Where-Object href -like "*.exe" | Where-Object href -notlike "*minimal*" | Select-Object -ExpandProperty href -First 1

    if (!($hasWHQL)) {
        $version = $version + "-optional"
    }
	
	return @{ 
        Version = $version; 
        URL64 = $combinedUrl; 
        ReleaseNotes = $releaseNotesUrl
    }
}

Update-Package -ChecksumFor none -NoCheckUrl