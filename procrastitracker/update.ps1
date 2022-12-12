Import-Module AU
Import-Module Wormies-AU-Helpers

if ($null -eq $env:github_user_name) {
    . ..\update_vars.ps1
}

$builds = 'https://github.com/aardappel/procrastitracker/actions?query=branch%3Amaster+is%3Asuccess+event%3Apush'
$api_base = 'https://api.github.com/repos/aardappel/procrastitracker/actions'

$base64key = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($env:github_user_name):$($env:github_api_key)"))
$gh_headers = @{
    Authorization = "Basic $base64key"
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }  
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*File\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
        }
    }
}

function global:au_BeforeUpdate() {
    
    Remove-Item -ea 0 -force -path 'tools\*.exe'
    Remove-Item -ea 0 -force -path 'tools\*.zip'
    
    $archive_name = 'artifact.zip'
    $archive_path = "tools\$archive_name"
    $Algorithm = 'sha256'
    
    
    Invoke-WebRequest -Outfile $archive_path -uri $latest.ArtifactURL -headers $gh_headers -UseBasicParsing
    Expand-Archive -path $archive_path -DestinationPath 'tools\' -Force
        
    Remove-Item -ea 0 -force -path 'tools\*.zip'
    
    $file_path = (Get-Childitem -path 'tools' -filter "*.exe") | Select -expand fullname
    $file_name = split-path $file_path -leaf
    
    $global:Latest.Checksum32 = Get-FileHash $file_path -Algorithm $Algorithm | ForEach-Object Hash
    $global:Latest.ChecksumType32 = $Algorithm
    $global:Latest.FileName32 = $file_name
}


function global:au_GetLatest {



    $builds_page  = Invoke-WebRequest -Uri $builds -UseBasicParsing -Headers $gh_headers
    $run_page_url = 'https://github.com' + $($builds_page.links | Where href -match "actions/runs/\d*$" | select -First 1 -ExpandProperty href)  
    $run_page     = Invoke-WebRequest -Uri $run_page_url -UseBasicParsing -Headers $gh_headers
    
    $run_number   = $run_page_url -split "/" | select -Last 1
    $run_list_url = $api_base + '/runs/' + $run_number + '/artifacts'
    $run_list_data = Invoke-RestMethod -UseBasicParsing -Method Get -Uri $run_list_url -Headers $gh_headers
    
    $artifact_info_url = $api_base + '/artifacts/' + ($run_list_data.artifacts.id | select -First 1) + '/zip'
    #$artifact_info_data = Invoke-WebRequest -UseBasicParsing -Uri $artifact_info_url -Headers $gh_headers
    
    #$url32       = $api_base + '/artifacts/' + ($run_list_data.artifacts.id | select -First 1) + '/zip'

    $timeago = ([xml]($run_page.content -split "`n" | where { $_ -like "*time-ago datetime*" })).'time-ago'.datetime
    if ([string]::IsNullOrEmpty($timeago)) {
        $datetime = [datetime]("2000-01-01")
    } else {
        $datetime = [datetime](([xml]($run_page.content -split "`n" | where { $_ -like "*time-ago datetime*" })).'time-ago'.datetime)
    }
 
    $version     = $datetime.ToUniversalTime().tostring("yyy.MM.dd") + '-ci'

    return @{   
        Version = $version; 
        URL32 = $run_page_url;
        Options = @{ Headers = $gh_headers };
        ArtifactURL = $artifact_info_url;
        
    }
}

Update-Package -ChecksumFor none -NoCheckUrl