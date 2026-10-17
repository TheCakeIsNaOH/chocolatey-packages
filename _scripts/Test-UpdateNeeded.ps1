function Test-UpdateNeeded() {
  param(
    [parameter(Mandatory=$true)][string]$RemoteVersion,
    [parameter(Mandatory=$true)][string]$PackageDir
  )

  $Nuspec = Get-ChildItem "$PackageDir\*.nuspec" -ErrorAction SilentlyContinue | Select-Object -First 1
  if (-not $Nuspec) {
    Write-Log "No .nuspec found in $PackageDir - assuming update is needed." -Color Yellow
    return $true
  }

  [xml]$Xml = Get-Content $Nuspec.FullName
  $LocalVersion = $Xml.package.metadata.version

  if ($LocalVersion -eq $RemoteVersion) {
    Write-Log "Local version ($LocalVersion) matches remote ($RemoteVersion). Skipping." -Color Gray
    return $false
  }

  Write-Log "Update needed: $LocalVersion -> $RemoteVersion" -Color Cyan
  return $true
}
