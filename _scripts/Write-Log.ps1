function Write-Log {
  param(
    [string]$Message,
    [string]$Color = "White"
  )
  $Timestamp = Get-Date -Format "HH:mm:ss"
  Write-Host "[$Timestamp] $Message" -ForegroundColor $Color
}
