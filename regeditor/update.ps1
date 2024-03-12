Import-Module Chocolatey-AU
Import-Module wormies-au-helpers

function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://www.oo-software.com/en/download/current/ooregeditor -UseBasicParsing
	$version = ($download_page.ToString() -split "[<>\s]" | sls "\d\d\.\d\.\d\d\d\d" | Select-Object -First 1).ToString().trim(",") 
    $url32 = "https://dl5.oo-software.com/files/ooregeditor12/120/ooregeditor.zip"
    
	return @{ Version = $version; URL32 = $url32; PackageName = 'regeditor' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
        }
    }
}

function global:au_BeforeUpdate() {
    Throw "Regeditor updated, please find URL manually."
    #Get-RemoteFiles -Purge -NoSuffix
}

Update-Package  -ChecksumFor none