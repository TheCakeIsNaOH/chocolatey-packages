<#
.SYNOPSIS
    Download file from the internet and calculate its checksum and get the file version

#>
function Get-RemoteChecksumVersion( [string] $Url, $Algorithm='sha256', $Headers ) {
    $fn = [System.IO.Path]::GetTempFileName()
    Invoke-WebRequest $Url -OutFile $fn -UseBasicParsing -Headers $Headers
    $res = Get-FileHash $fn -Algorithm $Algorithm | ForEach-Object Hash
    $item = Get-Item $fn
    $version = $item.VersionInfo.FileVersion
    Remove-Item $fn -ea ignore
    return $res.ToLower(),$version
}