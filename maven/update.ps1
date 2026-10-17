Import-Module Chocolatey-AU

$releases = 'https://downloads.apache.org/maven'
$minMajor = 3

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]version\s*=\s*)('.*')"         = "`$1'$($Latest.ActualVersion)'"
        }
        "legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"                    = "`${1} $($Latest.URL32)"
        }
        "maven.nuspec" = @{
            "apache-maven-[\d\.\-a-z]*"          = "apache-maven-$($Latest.ActualVersion)"
            "maven.apache.org/docs/[\d\.\-a-z]*" = "maven.apache.org/docs/$($Latest.ActualVersion)"
        }
    }
}

function global:au_BeforeUpdate() {
    Remove-Item .\apache-maven-* -Recurse
    Get-RemoteFiles -Purge -NoSuffix

    Expand-Archive -Path ".\tools\*.zip" -DestinationPath ".\" -Force

    Remove-Item ".\tools\*.zip"
}

function Get-AvailableMajors {
    $indexPage = Invoke-WebRequest -Uri "$releases/" -UseBasicParsing
    return $indexPage.links |
        Where-Object href -match '^maven-\d+/$' |
        ForEach-Object { $_.href -replace '^maven-|/$', '' } |
        Where-Object { [int]$_ -ge $minMajor } |
        Sort-Object { [int]$_ }
}

function Get-StreamVersions([string[]] $majors) {
    $versions = @()
    foreach ($major in $majors) {
        $indexPage = Invoke-WebRequest -Uri "$releases/maven-$major/" -UseBasicParsing
        $versions += $indexPage.links |
            Where-Object href -match '^\d+\.\d+\.\d+(-[0-9A-Za-z\-]+)?/?$' |
            ForEach-Object { $_.href.Trim('/') }
    }
    return $versions
}

function Get-Stream([string] $branch, [string] $version) {
    $major = $branch.Split('.')[0]
    $binariesUrl = "$releases/maven-$major/$version/binaries/"
    $downloadPage = Invoke-WebRequest -Uri $binariesUrl -UseBasicParsing
    $zip = $downloadPage.links |
        Where-Object href -match ('^apache-maven-' + [regex]::Escape($version) + '-bin\.zip$') |
        Select-Object -First 1 -ExpandProperty href
    if (!$zip) { return }

    @{ Version = $version; URL32 = $binariesUrl + $zip; PackageName = 'maven'; ActualVersion = $version }
}

function global:au_GetLatest {
    $versions = Get-StreamVersions (Get-AvailableMajors)

    $latest = @{}
    foreach ($version in $versions) {
        $branch = ($version -split '-')[0] -replace '\.\d+$', ''
        if (!$latest[$branch] -or (Get-Version $version) -gt (Get-Version $latest[$branch])) {
            $latest[$branch] = $version
        }
    }

    $streams = [ordered] @{}
    $latest.Keys |
        Sort-Object { Get-Version $latest[$_] } -Descending |
        ForEach-Object {
            $stream = Get-Stream $_ $latest[$_]
            if ($stream) { $streams[$_] = $stream }
        }

    return @{ Streams = $streams }
}

Update-Package -ChecksumFor none
