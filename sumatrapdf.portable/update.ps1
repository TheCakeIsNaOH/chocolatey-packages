Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        "tools\VERIFICATION.txt" = @{
			"(?i)(\s+x32:).*" = "`${1} $($Latest.URL32)"
			"(?i)(\s+x64:).*" = "`${1} $($Latest.URL64)"
		}
	}
}

function global:au_BeforeUpdate() {
	Remove-Item -Force -Path $([System.IO.Path]::Combine('.', 'tools', '*.exe'))
	Get-RemoteFiles -Purge -NoSuffix
	Get-ChildItem -Path $([System.IO.Path]::Combine('.', 'tools')) -Filter "*.zip" | Expand-Archive -DestinationPath $([System.IO.Path]::Combine('.', 'tools')) -Force
	Remove-Item -Force -Path ".\tools\*.zip"
	Move-Item -Path $([System.IO.Path]::Combine('.', 'tools', '*32.exe')) -Destination $([System.IO.Path]::Combine('.', 'tools', 'SumatraPDF-32.exe')) -Force
	Move-Item -Path $([System.IO.Path]::Combine('.', 'tools', '*64.exe')) -Destination $([System.IO.Path]::Combine('.', 'tools', 'SumatraPDF-64.exe')) -Force
}
 
function global:au_GetLatest {
    $download_page        = Invoke-WebRequest -UseBasicParsing -Uri https://www.sumatrapdfreader.org/download-free-pdf-viewer
	
    $regex64       = 'SumatraPDF-[\.\d]+-64\.zip'
    $regex32       = 'SumatraPDF-[\d\.]*zip'
	
    $url64         = 'https://www.sumatrapdfreader.org' + ($download_page.links | ? href -match $regex64 | select -First 1 -expand href)
    $url32         = 'https://www.sumatrapdfreader.org' + ($download_page.links | ? href -match $regex32 | select -First 1 -expand href)
	
    $version       = ($url32.trim("/") -split "-" | select -Last 1).trim(".zip")
	
    return @{ 
        Version = $version;
        URL32 = $url32; 
        URL64 = $url64;
        PackageName = 'sumatrapdf.portable';
    }
}


Update-Package -ChecksumFor none
