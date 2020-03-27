function Get-VeeamPNPerformance {
    [CmdletBinding()]
    param()

    Connect-VeeamPN

    $URI = "https://$($script:VeeamPNConnection.server)/api/monitor"
    $Body = @{
        jsonrpc = "2.0"
        id = "ext-1435"
        method = "getPerfObjects"
        params = @{
            filterType = ''
            filterMetric = ''
        }
    } | ConvertTo-Json -Compress
    Write-Verbose $Body

    $Result = Invoke-RestMethod $URI -Method Post -Headers $script:VeeamPNConnection.header -ContentType application/json -Body $Body
    if ($Result.error){
        Write-Error $Result.error -ErrorAction Stop
    }
    $Result.result
}