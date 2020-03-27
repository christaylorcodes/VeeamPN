function Disconnect-VeeamPN {
    [CmdletBinding()]
    param()
    try { Remove-Variable -Name 'VeeamPNConnection' -Scope 'Script' -Force -ErrorAction Stop}
    catch [System.Management.Automation.ItemNotFoundException] { Write-Verbose 'Not connected.'}
    catch { throw }
}