Function Uninstall-PathFromRegistry($pathToRemove) {
    # Using registry method prevents expansion (and loss) of environment variables (whether the target of the removal or not)
    # To avoid bad situations - does not use substring matching or regular expressions
    # Removes duplicates of the target removal path, Cleans up double ";", Handles ending "\"
    try {
        $regKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', $true)
        $unexpandedPath = $regKey.GetValue('Path', $null, 'DoNotExpandEnvironmentNames')

        foreach ($path in "$unexpandedPath".split(';')) {
            if ($pathToRemove -ine $path -and "$pathToRemove\" -ine $path) {
                [string[]]$newpath += "$path"
            }
        }
        $assembledNewPath = ($newpath -join (';')).trimend(';')

        $regKey.SetValue("Path", $assembledNewPath, "ExpandString")
    }
    finally {
        $regKey.Dispose()
    }
}

Function Uninstall-OldM2PathFromRegistry() {
    $pathToRemove = Join-Path '%M2_HOME%' 'bin'
    Uninstall-PathFromRegistry -pathToRemove $pathToRemove
}

Function Remove-PreviousVersions($installFolders) {
    $installs = Get-Childitem -Path $installFolders -Filter "apache-maven-*"
    
    $installs | ForEach-Object {
        Write-host "Removing old version $($_.name)"
        Uninstall-PathFromRegistry -pathToRemove (Join-Path $_.fullname 'bin')
        Remove-Item $_.fullname -Force -Recurse
    }
}

Function Show-JDKWarning () {
    Write-Output "**********************************************************************************"
    Write-Output "*                       !! No Java JDK detected on path !!                       *"
    Write-Output "*               Maven requires that a JDK be installed to function               *"
    Write-Output "*                                                                                *"
    Write-Output "*      However, this package does not take a dependency on any one specific      *"
    Write-Output "*          JDK package so as to not lock you into any specific JDK build         *"
    Write-Output "*                    Please separately install your JDK of choice                *"
    Write-Output "*                                                                                *"
    Write-Output "*See this issue on progress for the 'provides' nuspec element that will fix this:*"
    Write-Output "*                 https://github.com/chocolatey/choco/issues/858                 *"
    Write-Output "**********************************************************************************"
}