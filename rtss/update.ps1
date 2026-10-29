param([switch]$Force)

Import-Module Chocolatey-AU

$manifestsApi = 'https://api.github.com/repos/microsoft/winget-pkgs/contents/manifests/g/Guru3D/RTSS'
$manifestBase = 'https://raw.githubusercontent.com/microsoft/winget-pkgs/master/manifests/g/Guru3D/RTSS'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?im)(^\s*url\s*=\s*)('.*')"                             = "`$1'$($Latest.URL32)'"
            "(?im)(^\s*checksum\s*=\s*)('.*')"                        = "`$1'$($Latest.Checksum32)'"
            "(?im)(^\s*file\s*=\s*Join-Path\s+[$]extractDir\s+)('.*')" = "`$1'$($Latest.RelativeFilePath)'"
        }
    }
}

function global:au_GetLatest {
    $dirs = Invoke-RestMethod -Uri $manifestsApi

    $latest = $dirs |
        Where-Object type -eq 'dir' |
        Sort-Object { try { [version]$_.name } catch { [version]'0' } } -Descending |
        Select-Object -First 1

    if (-not $latest) { throw "No version directories found under $manifestsApi" }
    $version = $latest.name

    $yaml = Invoke-RestMethod -Uri "$manifestBase/$version/Guru3D.RTSS.installer.yaml"

    $installerUrl     = [regex]::Match($yaml, '(?m)^\s*-?\s*InstallerUrl:\s*(\S+)\s*$').Groups[1].Value
    $installerSha256  = [regex]::Match($yaml, '(?m)^\s*-?\s*InstallerSha256:\s*(\S+)\s*$').Groups[1].Value
    $relativeFilePath = [regex]::Match($yaml, '(?m)^\s*-?\s*RelativeFilePath:\s*(\S+)\s*$').Groups[1].Value
    $nestedType       = [regex]::Match($yaml, '(?m)^\s*-?\s*NestedInstallerType:\s*(\S+)\s*$').Groups[1].Value

    if (!$installerUrl -or !$installerSha256 -or !$relativeFilePath) {
        throw "Failed to parse Guru3D.RTSS.installer.yaml for version $version"
    }

    if ($nestedType -and $nestedType -ne 'nullsoft') {
        throw "Unexpected NestedInstallerType '$nestedType' - silentArgs in tools\chocolateyinstall.ps1 may need review"
    }

    $installerUrl = $installerUrl.Replace('[', '%5B').Replace(']', '%5D')

    return @{
        Version          = $version
        URL32            = $installerUrl
        Checksum32       = $installerSha256
        ChecksumType32   = 'sha256'
        RelativeFilePath = $relativeFilePath
    }
}

try {
    update -ChecksumFor none -Force:$Force
} catch {
    if ($_ -match '404') { Write-Host "$_"; return 'ignore' }
    throw
}
