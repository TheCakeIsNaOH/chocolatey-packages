function Get-GitHubLatestReleaseLinks() {
  param(
    [parameter(Mandatory=$true)][string]$user,
    [parameter(Mandatory=$true)][string]$repository
  )
  
  $latest_releases_url = "https://github.com/" + $user + "/" + $repository + "/releases/latest"
  $redirected_releses_url = Get-RedirectedUrl -url $latest_releases_url
  $expanded_assets_url = $redirected_releses_url -replace "/tag/","/expanded_assets/"
  $assets_page = Invoke-WebRequest -Uri $expanded_assets_url -UseBasicParsing
  return $assets_page
}