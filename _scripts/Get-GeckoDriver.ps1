function Get-GeckoDriver() {
  $FoundCmd = Get-Command geckodriver.exe -ErrorAction SilentlyContinue
  $PossiblePaths = @(
    "C:\webdrivers",
    "C:\ProgramData\chocolatey\bin",
    "C:\ProgramData\chocolatey\lib\selenium-gecko-driver\tools",
    "$env:TEMP\geckodriver"
  )

  if ($null -ne $FoundCmd) { $PossiblePaths += Split-Path $FoundCmd.Path }

  foreach ($Path in $PossiblePaths) {
    if ($null -ne $Path -and (Test-Path "$Path\geckodriver.exe")) {
      Write-Log "Found geckodriver at: $Path" -Color Gray
      return $Path
    }
  }

  Write-Log "geckodriver.exe not found. Downloading latest win64 release from GitHub..." -Color Cyan

  $Dest = Join-Path $env:TEMP "geckodriver"
  if (-not (Test-Path $Dest)) { New-Item $Dest -ItemType Directory | Out-Null }

  $Release = Invoke-RestMethod "https://api.github.com/repos/mozilla/geckodriver/releases/latest" -UseBasicParsing
  $Asset   = $Release.assets | Where-Object { $_.name -match 'win64' -and $_.name -match 'zip' } | Select-Object -First 1

  if (-not $Asset) { throw "Could not find a win64 geckodriver asset in the latest GitHub release." }

  $ZipPath = Join-Path $Dest "gecko.zip"
  Invoke-WebRequest $Asset.browser_download_url -OutFile $ZipPath -UseBasicParsing
  Expand-Archive -Path $ZipPath -DestinationPath $Dest -Force
  Remove-Item $ZipPath -Force

  Write-Log "geckodriver downloaded to: $Dest" -Color Green
  return $Dest
}
