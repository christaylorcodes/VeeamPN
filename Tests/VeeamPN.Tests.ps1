$Verbose = @{}
if($env:APPVEYOR_REPO_BRANCH -and $env:APPVEYOR_REPO_BRANCH -notlike "master")
{
    $Verbose.add("Verbose",$True)
}

$PSVersion = $PSVersionTable.PSVersion.Major
Import-Module $PSScriptRoot\..\VeeamPN\VeeamPN.psm1 -Force

$ServiceName = 'OpenVPNService'

#Integration test example
Describe "Install-OpenVPN  PS$PSVersion Integrations tests" {

    Context 'Strict mode' {

        Set-StrictMode -Version latest

        It 'should install' {
            try {
                Install-OpenVPN -ErrorAction Stop
                $Service = Get-Service $ServiceName -ErrorAction SilentlyContinue
                $Service | Should -Not -BeNullOrEmpty
            }
            catch { $_ | Should -BeNullOrEmpty }
        }
    }
}
