$ErrorActionPreference = 'Stop'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

if ($env:ChocolateyForceX86 -eq 'true' -and (Get-ProcessorBits 64) -eq 'true') {
  Write-Error "32-bit install not supported on a 64-bit machine"
}

if ((Get-ProcessorBits 32) -eq 'true') {
  $architecture = 'x86'
} elseif ((Get-ProcessorBits 64) -eq 'true') {
  $architecture = 'x64'
} else {
  Write-Error 'Unsupported CPU architecture'
}

add-type @"
public struct Language {
   public string Code;
   public string Name;
   public string Mapping;
}
"@

$languages =  @{
    'br'    = [Language] @{ Code='br';    Name = 'Brazilian (Portuguese)';   Mapping = 'PTB' }
    'de'    = [Language] @{ Code='de';    Name = 'German';                   Mapping = 'DEU' }
    'en'    = [Language] @{ Code='en';    Name = 'English';                  Mapping = 'ENU' }
    'es'    = [Language] @{ Code='es';    Name = 'Spanish';                  Mapping = 'ESN' }
    'fr'    = [Language] @{ Code='fr';    Name = 'French';                   Mapping = 'FRA' }
    'it'    = [Language] @{ Code='it';    Name = 'Italian';                  Mapping = 'ITA' }
    'ja'    = [Language] @{ Code='ja';    Name = 'Japanese';                 Mapping = 'JPN' }
    'ko'    = [Language] @{ Code='ko';    Name = 'Korean';                   Mapping = 'KOR' }
    'ru'    = [Language] @{ Code='ru';    Name = 'Russian';                  Mapping = 'RUS' }
    'zh'    = [Language] @{ Code='zh';    Name = 'Chinese';                  Mapping = 'CHS' }
    'zh-CN' = [Language] @{ Code='zh-CN'; Name = 'Chinese (Simplified)';     Mapping = 'CHS' }
    'zh-TW' = [Language] @{ Code='zh-TW'; Name = 'Chinese (Traditional)';    Mapping = 'CHT' }
}

$pp = Get-PackageParameters

# check the language parameter and default to 'en' if not supplied
$language = $pp['Language']

if ($null -eq $language -or $language -eq '') {
  $language = 'en'
}

$relang = “(?i)^(br|de|en|es|fr|it|ja|ko|ru|zh|zh-CN|zh-TW)$”

if ($language -notmatch $relang) {
  Write-Error "Unsupported language $($pp.Language)"
}

$mapping = $languages[$language].Mapping

# construct the filename and extract the relevant installer to a temp directory
$fileName = "{0}\SSCERuntime-{1}.exe" -f $toolsDir, $mapping

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.IO.Path]::GetRandomFileName())
if (![System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null }

Start-Process "$fileName" -ArgumentList "/T:`"$tempDir`" /q" -Wait

$packageArgs32 = @{
  PackageName    = "$($env:ChocolateyPackageName)-x32"
  FileType       = 'msi'
  File           = "{0}\SSCERuntime_x86-{1}.msi" -f $tempDir, $mapping
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyInstallPackage @packageArgs32

if ($architecture -eq 'x64') {
    $packageArgs64 = @{
        PackageName    = "$($env:ChocolateyPackageName)-x64"
        FileType       = 'msi'
        File           = "{0}\SSCERuntime_x64-{1}.msi" -f $tempDir, $mapping
        SilentArgs     = '/quiet /qn /norestart'
        ValidExitCodes = @(0, 1641, 3010)
    }

    Install-ChocolateyInstallPackage @packageArgs64
}

Remove-Item -Path "$toolsDir\*.exe" -Force -EA 0
Remove-Item -Path "$tempDir" -Force -EA 0 -Recurse