$ErrorActionPreference = 'Stop' # stop on all errors

$binArgs = @{
    Name    = "cpack"
}

Uninstall-BinFile @binArgs