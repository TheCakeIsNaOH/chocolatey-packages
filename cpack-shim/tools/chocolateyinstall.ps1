$ErrorActionPreference = 'Stop' # stop on all errors

$binArgs = @{
    Name    = "cpack"
    Path    = "choco.exe"
    Command = "pack"
}

Install-BinFile @binArgs
