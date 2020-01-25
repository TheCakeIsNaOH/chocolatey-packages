Import-Module AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
		}
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix 
	
	Remove-Item -Path (Get-ChildItem .\tools -Filter "*.ignore").fullname
	Out-File -FilePath ((Get-Childitem .\tools -Filter "*.exe").fullname + ".ignore")
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://github.com/windows-2048/The-Fastest-Mouse-Clicker-for-Windows/releases/latest -UseBasicParsing
	
	$url        = $download_page.links | ? href -match 'exe' | select -first 1 -ExpandProperty href
	$version    = ($url -split '[/]' | select -Last 1 -Skip 1).substring(1)
	$modurl     = 'https://github.com' + $url 

	return @{ Version = $version; URL32 = $modurl; PackageName = 'fastest-mouse-clicker'}
}

Update-Package  -ChecksumFor none