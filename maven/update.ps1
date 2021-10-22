Import-Module AU

$releases = "https://apache.claz.org/maven/maven-3/"

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^[$]version\s*=\s*)('.*')"      = "`$1'$($Latest.ActualVersion)'"
        }
	    "legal\VERIFICATION.txt" = @{
			"(?i)(\s+x32:).*" = "`${1} $($Latest.URL32)"
		}
		"maven.nuspec" = @{
			"apache-maven-[\d\.]*" = "apache-maven-$($Latest.ActualVersion)"
            "maven.apache.org/docs/[\d\.d]*" = "maven.apache.org/docs/$($Latest.ActualVersion)"
		}
    }
}

function global:au_BeforeUpdate() {
	remove-item .\apache-maven-*  -Recurse
    Get-RemoteFiles -Purge -NoSuffix 
    
	Expand-Archive -Path ".\tools\*.zip" -DestinationPath ".\" -Force

	Remove-Item ".\tools\*.zip"
}

function global:au_GetLatest {
	$version_page  = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$versionRegex  = '\d\.\d+.\d+'
	$partUrl32     = $version_page.links | ? href -match $versionRegex | select -Last 1 -expand href 
	$version       = $partUrl32.trim("/")
	$prefixUrl32   = $releases + $partUrl32 + "binaries/"
	$download_page = Invoke-WebRequest -Uri $prefixUrl32 -UseBasicParsing
	$downloadRegex = "\.zip"
	$url32         = $prefixUrl32 + $($download_page.links | ? href -match $downloadRegex | select -expand href)
	
	return @{ Version = $version; URL32 = $url32; PackageName = "maven"; ActualVersion = $version }
}

Update-Package -ChecksumFor none

