Import-Module AU

function global:au_SearchReplace {
   @{
        "sumatrapdf.nuspec" = @{
            "(\<dependency .+?`"sumatrapdf.install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri https://www.sumatrapdfreader.org/download-free-pdf-viewer.html
    $regex         = 'SumatraPDF-[\d\.]*\d-install.exe'
    $relative_url  = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $version       = $relative_url -split '-' | select -Last 1 -Skip 1
	
    return @{ 
        Version = $version;
        PackageName = 'sumatrapdf';
    }
}


Update-Package -ChecksumFor none #-nocheckchocoversion