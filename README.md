# Chocolatey package sources for the [Chocolatey Community Repository](https://chocolatey.org/packages)

[![Build status](https://ci.appveyor.com/api/projects/status/a4a5f2s7q2wpxnpg/branch/master?svg=true)](https://ci.appveyor.com/project/TheCakeIsNaOH/chocolatey-packages/branch/master)
[![](http://transparent-favicon.info/favicon.ico)](#)
[Update status](https://gist.github.com/TheCakeIsNaOH/ce0572a342ee6b22e44239db8c54f8b1)
[![](http://transparent-favicon.info/favicon.ico)](#)
[chocolatey/TheCakeIsNaOH](https://chocolatey.org/profiles/TheCakeIsNaOH )

----

The majority of the packages in this repository are automatically updated using [AU](https://github.com/majkinetor/au).

----

If a package is out of date by more than a day or two, please open a [Outdated package issue](https://github.com/TheCakeIsNaOH/chocolatey-packages/issues/new?template=outdated-package.md)

Or contact me directly via the contact maintainers button on one of my packages on the Chocolatey Community Repository if you don't have/want a Github account.

----

Prerequites to run the automatic update scripts:
- Powershell 5+.
- [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au): `Install-Module au` or `choco install au`.

----

Scripts can be tested with the `test_all.ps1` script, run with no arguments to force update all package, or pass package names to force update individual packages.
Please be advised that this will update the version with [package fix notation](https://docs.chocolatey.org/en-us/create/create-packages#package-fix-version-notation), so a `git reset --hard` will be required to get back to a clean tree.

To test an individual update script, either:
1. Manually bump down the version in the `.nuspec` and run `$au_NoCheckCHocoVersion = $true` 
2. Run `$au_force = $true`, although this will add a [package fix notation](https://docs.chocolatey.org/en-us/create/create-packages#package-fix-version-notation) to the version.
Then run the `update.ps1` script.

----

Files for each package are located in their own directories, with the exception of the icons, which are located in the `Icons` directory.