function Connect-VeeamPN {
    [CmdletBinding()]
    param(
        [string]$VeeamPNServer,
        [pscredential]$Credential,
        [switch]$Force
    )

    # Cache Check
    if (!$Force -and $script:VeeamPNConnection.expiration -and $script:VeeamPNConnection.expiration -gt $(Get-Date)){
        Write-Verbose 'Using cached VeeamPN connection info.'
        return
    }
    if ($Force) { Remove-Variable -Name VeeamPNConnection -Scope script -ErrorAction SilentlyContinue }

    # Check for creds
    if (!$script:VeeamPNConnection.credential -and !$Credential){
        Write-Error 'Credentials are needed, use Connect-VeeamPN to establish connection.' -ErrorAction Stop
    }

    # Check for cached info
    if (!$Credential) { $Credential = $script:VeeamPNConnection.credential}
    if (!$VeeamPNServer) { $VeeamPNServer = $script:VeeamPNConnection.server}

    $URI = "https://$($VeeamPNServer)/api/auth"

    # Ignore self sign
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

    $Body = @{
        jsonrpc = "2.0"
        id = "ext-52"
        method = "login2"
        params = @{
            username = $Credential.UserName
            password = $Credential.GetNetworkCredential().Password
            rememberMe = $false
        }
    } | ConvertTo-Json -Compress

    $Result = Invoke-RestMethod $URI -Method Post -Body $Body

    if ($Result.error){
        Write-Error $Result.error -ErrorAction Stop
    }

    # Build cache
    $script:VeeamPNConnection = @{
        server = $VeeamPNServer
        expiration = (Get-Date).AddSeconds($Result.result.expiresIn)
        credential = $Credential
        header = @{
            Authorization = "Bearer $($Result.result.token)"
        }
    }
    Write-Verbose "Connection to $VeeamPNServer cached"
}