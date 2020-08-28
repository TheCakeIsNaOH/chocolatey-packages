Import-Module AU


function global:au_SearchReplace {
    @{
        "tools\VERIFICATION.txt" = @{
			"(?i)(\s+x32:).*" = "`${1} $($Latest.URL32)"
		}
	}
}

function global:au_BeforeUpdate() {
    Start-Sleep -s 10
	Get-RemoteFiles -Purge -NoSuffix 
    Start-Sleep -s 10
}


function global:au_GetLatest {
	#docsUrl = "https://docs.nextcloud.com/desktop/"
	$stable_page        = Invoke-WebRequest -Uri https://download.nextcloud.com/desktop/releases/Windows -UseBasicParsing
	$stable_name        = $stable_page.links | ? href -match '.exe$'| % href | select -last 1
	$stable_version     = ($stable_name -split '[-]' | select -Last 1 -Skip 1).replace('_','-')
	$stable_modurl      = 'https://download.nextcloud.com/desktop/releases/Windows/' + $stable_name
	
	Start-Sleep -s 5
	$pre_page        = Invoke-WebRequest -Uri https://download.nextcloud.com/desktop/prereleases/Windows -UseBasicParsing
	$pre_name        = $pre_page.links | ? href -match '.exe$'| % href | select -last 1
	$pre_version     = ($pre_name -split '[-]' | select -First 2 -Skip 1) -join "-"
	$pre_modurl      = 'https://download.nextcloud.com/desktop/prereleases/Windows/' + $pre_name
	
	
	#$partVersion = ($version -split '\.' | select -First 2) -join "."
	#$docsUrl = $docsUrl + $partVersion
	
	$useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::Firefox
	
	return @{ 	
				Streams = [ordered] @{
						'Stable' = @{ 
							Version = $stable_version; 
							URL32 = $stable_modurl; 
							PackageName = 'nextcloud-client'; 
							Options = @{ Headers = @{ 'User-Agent' = $useragent } }; 
							}
						'Pre' = @{
							Version = $pre_version; 
							URL32 = $pre_modurl; 
							PackageName = 'nextcloud-client'; 
							Options = @{ Headers = @{ 'User-Agent' = $useragent } }; 
						}
				}
			}
}

Update-Package -ChecksumFor none -nocheckurl #-nocheckurl #-nocheckchocoversion

#todo
# AU
# re add in docs URL
#	<docsUrl>https://docs.nextcloud.com/desktop/2.6</docsUrl>
#		".\nextcloud-client.nuspec" = @{
#			"\<docsUrl\>.+" = "<docsUrl>$($Latest.docsUrl)</docsUrl>"
#		}