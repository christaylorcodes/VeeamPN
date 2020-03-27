function Get-VeeamPNClient {
    [CmdletBinding()]
    param()

    Connect-VeeamPN

    $URI = "https://$($script:VeeamPNConnection.server)/api/clients"
    $Body = @{
        jsonrpc = "2.0"
        id = "ext-229"
        method = "getClients"
        params = @{}
    } | ConvertTo-Json -Compress
    Write-Verbose $Body

    $Result = Invoke-RestMethod $URI -Method Post -Headers $script:VeeamPNConnection.header -ContentType application/json -Body $Body

    if ($Result.error){
        Write-Error $Result.error -ErrorAction Stop
    }
    $Result.result.clients
}