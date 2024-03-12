Import-Module Chocolatey-AU
#uses anydesk.portable updater
. $([System.IO.Path]::Combine($PSScriptRoot, '..', 'anydesk.portable', 'update.ps1'))

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{    
            "(\<dependency .+?`"$($Latest.PackageName).portable`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
		}
	}
}

function global:au_BeforeUpdate {
}

Update-Package -ChecksumFor none