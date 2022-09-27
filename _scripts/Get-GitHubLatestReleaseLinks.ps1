function Get-GitHubLatestReleaseLinks() {
  param(
    [parameter(Mandatory=$true)][string]$user,
    [parameter(Mandatory=$true)][string]$repository,
    [switch]$absolutelatestrelease
  )
  
  if ($absolutelatestrelease) {
    $releases_url = "https://github.com/" + $user + "/" + $repository + "/releases"
    $releases_page = Invoke-WebRequest -Uri $releases_url -UseBasicParsing
    $release_tag_url = "https://github.com" + ($releases_page.links | Where-Object href -match "/tag/v" | Select-Object -First 1 -ExpandProperty href)
  } else {
    $latest_releases_url = "https://github.com/" + $user + "/" + $repository + "/releases/latest"
    $release_tag_url = Get-RedirectedUrl -url $latest_releases_url
  }

  $expanded_assets_url = $release_tag_url -replace "/tag/","/expanded_assets/"
  $assets_page = Invoke-WebRequest -Uri $expanded_assets_url -UseBasicParsing
  return $assets_page
}