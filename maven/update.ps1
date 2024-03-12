Import-Module Chocolatey-AU

$releases = "https://downloads.apache.org/maven/maven-3/"
#$releases = "https://archive.apache.org/dist/maven/maven-3/"

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
	$downloadRegex = "\.zip$"
	$url32         = $prefixUrl32 + $($download_page.links | ? href -match $downloadRegex | select -expand href)
	
	return @{ Version = $version; URL32 = $url32; PackageName = "maven"; ActualVersion = $version }
}


<#function GetStreams() {
  param($releaseUrls)
  $streams = @{ }

  $releaseUrls | % {
    $actualVersion = $_.trim('/')
    $version = $actualVersion + "." + (Get-Date -Format "yyyyMMdd")
    
    $downloadPageUrl = $releases + $_ + "binaries/"
    $download_page = Invoke-WebRequest -Uri $downloadPageUrl -UseBasicParsing

    $relURL = $download_page.links | Where-Object href -match "apache-maven-.*\.zip$" | select -first 1 -expand href
    $url32 = $downloadPageUrl + $relURL

    $streams.$version = @{ Version = $version; URL32 = $url32; PackageName = "maven"; ActualVersion = $actualVersion }
  }

  Write-Host $streams.Count 'streams collected'
  $streams
}

function global:au_GetLatest {
  $versions_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = "\d\.\d\.\d/"
  $releaseUrls = $versions_page.links | ? href -match $re | select -ExpandProperty href
  

  @{ Streams = GetStreams $releaseUrls }
} #>

Update-Package -ChecksumFor none

