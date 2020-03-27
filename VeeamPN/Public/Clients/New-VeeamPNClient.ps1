function New-VeeamPNClient {
    [CmdletBinding()]
    param(
        [Parameter(mandatory=$true)]
        [string]$ClientName,
        [switch]$DefaultGateway
    )

    Connect-VeeamPN

    $URI = "https://$($script:VeeamPNConnection.server)/api/clients"
    $Body = @{
        jsonrpc = "2.0"
        id = "ext-1434"
        method = "addClient"
        params = @{
            type = "endpoint"
            name = $ClientName
            props = @{
                defaultGW = $DefaultGateway.IsPresent
            }
        }
    } | ConvertTo-Json -Compress
    Write-Verbose $Body

    $Result = Invoke-RestMethod $URI -Method Post -Headers $script:VeeamPNConnection.header -ContentType application/json -Body $Body

    if ($Result.error){
        Write-Error $Result.error -ErrorAction Stop
    }
    $Result.result
}