function Get-VeeamPNClientConfig {
    [CmdletBinding()]
    param(
        [Parameter(mandatory=$true)]
        [int]$ID,
        [string]$OutputPath = $env:TEMP,
        [switch]$Force,
        [switch]$NoClobber
    )

    Connect-VeeamPN

    $URI = "https://$($script:VeeamPNConnection.server)/api/clients"
    $Body = @{
        jsonrpc = "2.0"
        id = "ext-1435"
        method = "downloadConfig"
        params = @{
            id = $ID
        }
    } | ConvertTo-Json -Compress
    Write-Verbose $Body

    $Result = Invoke-RestMethod $URI -Method Post -Headers $script:VeeamPNConnection.header -ContentType application/json -Body $Body
    if ($Result.error){
        Write-Error $Result.error -ErrorAction Stop
    }

    $OutFile = $(Join-Path $OutputPath $Result.result.filename)
    $Result.result.packageFile | Out-File $OutFile -Force:$Force.IsPresent -NoClobber:$NoClobber.IsPresent
    Write-Output $OutFile
}