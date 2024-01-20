Import-Module AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksumExe:).*"       = "`${1} $($Latest.ChecksumExe)"
        }
	}
}

function global:au_BeforeUpdate {
    Remove-Item "tools\*.exe"
    Get-RemoteFiles -Purge -NoSuffix
    $zipFile = Get-Childitem -Path ".\tools" -Filter "*.zip"
    Expand-Archive -Path $zipFile.Fullname -DestinationPath ".\tools\temp" -Force
    $exeFile = Get-ChildItem -Recurse -Path ".\tools\temp" -Filter ("grep-" + $Latest.Version + "-x64.exe")
    Copy-Item -Path $exeFile.Fullname -Destination ".\tools\grep.exe" -Force

	Remove-Item $zipFile.Fullname -EA 0
    Remove-Item -Recurse -Path ".\tools\temp" -Force -Ea 0
    
    $Latest.ChecksumExe = Get-Childitem -Path '.\tools\grep.exe' | Get-FileHash | Select-Object -ExpandProperty hash
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "mbuilov" -Repository "grep-windows"
	
    $match64 = "[\d\.]+\.zip"
	$url64   = 'https://github.com' + ($download_page.links | ? href -match $match64 | Select-Object -First 1 -ExpandProperty href)
	$version = ($url64 -split '/' | select -Last 1).trim(".zip")
    
	return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor none