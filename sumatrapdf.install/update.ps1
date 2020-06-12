Import-Module AU

function global:au_SearchReplace {
    @{
        "tools\VERIFICATION.txt" = @{
			"(?i)(\s+x32:).*" = "`${1} $($Latest.URL32)"
			"(?i)(\s+x64:).*" = "`${1} $($Latest.URL64)"
		}
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge
}

function global:au_GetLatest {
    $download_page        = Invoke-WebRequest -UseBasicParsing -Uri https://www.sumatrapdfreader.org/download-free-pdf-viewer.html
	
    $regex64       = 'SumatraPDF-[\d\.]*\d-64-install.exe'
    $regex32       = 'SumatraPDF-[\d\.]*\d-install.exe'
    $baseURL       = 'https://www.sumatrapdfreader.org'
	
    $url64         = $baseURL + "$($download_page.links | ? href -match $regex64 | select -First 1 -expand href)"
    $url32         = $baseURL + "$($download_page.links | ? href -match $regex32 | select -First 1 -expand href)"
	
    $version       = $url32 -split '-' | select -Last 1 -Skip 1
	
    return @{ 
        Version = $version;
        URL32 = $url32; 
        URL64 = $url64;
        PackageName = 'sumatrapdf.install';
    }
}

Update-Package -ChecksumFor none -nocheckchocoversion