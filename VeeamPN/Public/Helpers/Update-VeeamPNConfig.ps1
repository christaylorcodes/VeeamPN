function Update-VeeamPNConfig {
    [CmdletBinding()]
    param(
        [Parameter(mandatory=$true)]
        [string]$Config,
        [hashtable]$Routes,
        [string[]]$DNS
    )

    $ConfigAddition = @("nobind","")

    try{
        $ConfigContent= Get-Content $Config
    }
    catch{
        Write-Error $_ -ErrorAction Stop
    }

    # Add Routes
    if($ConfigContent -match 'route '){
        Write-Warning 'Config already has route entries'
    }
    else {
        foreach ($Route in $Routes.GetEnumerator()){
            $ConfigAddition += "route $($Route.Name) $($Route.Value)"
        }
    }

    # Add DNS
    if($ConfigContent -match 'register-dns'){
        Write-Warning 'Config already has DNS entries'
    }
    elseif($DNS.count -gt 0) {
        foreach($Server in $DNS){
            $ConfigAddition += "dhcp-option DNS $Server"
        }
        $ConfigAddition += "register-dns"
        $ConfigAddition += "block-outside-dns"
    }

    # Update config
    $ConfigContent-replace 'nobind', $($ConfigAddition | Out-String) | Out-File $Config -Force -Encoding utf8
}