Import-Module AU
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*file\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
	$download_page = Get-GitHubLatestReleaseLinks -User "JosefNemec" -Repository "Playnite"
    
	$url        = $download_page.links | ? href -match '.exe$' | Select-Object -First 1 -ExpandProperty href
	$version    = ($url -split '/' | select -Last 1 -Skip 1)
	$modurl     = 'https://github.com' + $url 
    
	return @{ Version = $version; URL32 = $modurl; Changelog = $changelog; }
}

Update-Package -ChecksumFor none


<#
### Starting variables
#Requires -Version 7
Set-Location -Path $pwd
$ProgressPreference = 'SilentlyContinue'

$local = @{
  chocoinstallpath = ".\tools\chocolateyinstall.ps1"
  chocoinstall     = Get-Content .\tools\chocolateyinstall.ps1
  url              = Get-Content .\tools\chocolateyinstall.ps1 | Select-String -Pattern 'http' | Select-Object -ExpandProperty Line
  checksum         = Get-Content .\tools\chocolateyinstall.ps1 | Select-String -Pattern 'checksum      ' | Select-Object -ExpandProperty Line
  nuspecpath       = ".\playnite.nuspec"
  nuspec           = Get-Content .\playnite.nuspec
  version          = Get-Content .\playnite.nuspec | Select-String -Pattern '(?<=\<version\>).*?(?=\<\/version\>)' -AllMatches | ForEach-Object {$_.matches.value}
  releaseNotes     = Get-Content .\playnite.nuspec | Select-String -Pattern '(?<=\<releaseNotes\>).*?(?=\<\/releaseNotes\>)' -AllMatches | ForEach-Object {$_.matches.value}
}

$remote = @{
  info             = Invoke-WebRequest 'https://playnite.link/update/stable/info.json' | ConvertFrom-Json
}

Write-Host "Checking nuspec version ..." $local.version
Write-Host "Checking latest version ..." $remote.info.latestVersion

If ($local.version -eq $remote.info.latestVersion) {
  Write-Host "Versions match, exiting ..."
  Exit
  }

Write-Host "Version does not match."

### Stage variables for the download URL
$dl = "https://playnite.link/update/stable/"
$rn = "https://playnite.link/update/"
$sv = $remote.info.latestVersion -replace '[.]'
$fulldl = $dl + $remote.info.latestVersion + '/' + 'Playnite' + $sv + '.exe'
$fullrn = $rn + $remote.info.latestVersion + '.html'

### Download to temp directory
Write-Host 'Downloading Playnite' $remote.info.latestVersion '...'
Invoke-WebRequest $fulldl -OutFile $env:TEMP\playnite.exe

### Grab the SHA256 of the download for Chocolatey
$newchecksum = Get-FileHash -Algorithm SHA256 -Path $env:TEMP\playnite.exe | ForEach-Object { $_.Hash }
Write-Host ''
Write-Host 'Playnite' $remote.info.latestVersion 'downloaded to' $env:TEMP'\playnite.exe'
Write-Host 'SHA256 is' $newchecksum
Write-Host ''
Write-Host 'Sleeping 10 seconds before editing Chocolatey files ...'
Write-Host ''
Start-Sleep -Seconds 10

### Delete the temp file - we no longer need it
Remove-Item -Path $env:TEMP\playnite.exe

### Stage variables for updating the Chocolatey files.
$newurl = "`$url        = '$fulldl'"
$newchecksumline = "  checksum      = '$newchecksum'"
  
### Update the Chocolatey install PS1 and the nuspec file.
$local.chocoinstall | ForEach-Object { $_.replace($local.url,$newurl) } | Set-Content -Path $local.chocoinstallpath -Encoding UTF8
Write-Host 'Updated' $local.chocoinstallpath 'URL value'
Start-Sleep -Milliseconds 500
$local.chocoinstall = Get-Content .\tools\chocolateyinstall.ps1
$local.chocoinstall | ForEach-Object { $_.replace($local.checksum,$newchecksumline) } | Set-Content -Path $local.chocoinstallpath
Write-Host 'Updated' $local.chocoinstallpath 'checksum value'
Start-Sleep -Milliseconds 500
$local.nuspec | ForEach-Object { $_.replace($local.version,$remote.info.latestVersion) } | Set-Content -Path $local.nuspecpath
Write-Host 'Updated' $local.nuspecpath 'version value'
Start-Sleep -Milliseconds 500
$local.nuspec = Get-Content .\playnite.nuspec
$local.nuspec | ForEach-Object { $_.replace($local.releaseNotes,$fullrn) } | Set-Content -Path $local.nuspecpath
Write-Host 'Updated' $local.nuspecpath 'releaseNotes value'

### Compile the new Chocolatey package.
choco pack $local.nuspecpath

### Upload the new Chocolatey package.
$nupkg = 'playnite.' + $remote.info.latestVersion + '.nupkg'
Start-Sleep -Seconds 10
choco push $nupkg

### Delete the Chocolatey nupkg file as it's no longer needed.
Remove-Item -Path .\$nupkg #>