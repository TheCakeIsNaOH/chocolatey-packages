# NOTE: No documentation will be written for this script.
# This is only a temporary script until a generic version
# have been added to the wormies-au-helpers powershell package

function Update-OnETagChanged() {
  param(
    [uri]$execUrl,
    [string]$saveFile = ".{0}info" -f [IO.Path]::DirectorySeparatorChar,
    [scriptblock]$OnETagChanged,
    [scriptblock]$OnUpdated,
    $headers
  )

  $request = [System.Net.WebRequest]::CreateDefault($execUrl)
  if ($headers) {
    if ($headers.'user-agent') {
      $request.UserAgent = $headers.'user-agent'
    }
    if ($headers.accept) {
      $request.accept = $headers.accept
    }
    if ($headers.Referer) {
      $request.Referer = $headers.Referer
    }
  }

  try {
    $response = $request.GetResponse()
    $etag = $response.Headers.Get("ETag")
  }
  finally {
    $response.Dispose()
    $response = $null
  }

  $saveResult = $false
  if (!(Test-Path $saveFile) -or ($global:au_Force -eq $true)) {
    $result = . $OnETagChanged
    $saveResult = $true
  }
  else {
    $existingInfo = (Get-Content $saveFile -Encoding UTF8 -TotalCount 1) -split '\|'

    if ($existingInfo[0] -ne $etag) {
      $result = . $OnETagChanged
      $saveResult = $true
    }
    else {
      $result = . $OnUpdated
      $result["Version"] = $existingInfo[1]
      $result["ETAG"] = $existingInfo[0]
      $saveResult = $false
    }
  }

  if ($saveResult) {
    $result["ETAG"] = $etag
    "$($result["ETAG"])|$($result["Version"])" | Out-File $saveFile -Encoding utf8 -NoNewline
  }

  return $result
}
