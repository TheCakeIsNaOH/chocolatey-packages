function Get-ChromeCanaryVersion() {
  $root   = 'HKLM:\SOFTWARE\Google\Update\Clients'
  $root64 = 'HKLM:\SOFTWARE\Wow6432Node\Google\Update\Clients'
  foreach ($r in $root,$root64) {
    $gcb = Get-ChildItem $r -ea 0 | Where-Object { (Get-ItemProperty $_.PSPath).name -eq 'Google Chrome Canary' }
    if ($gcb) { return $gcb.GetValue('pv') }
  }
}
