function Install-OpenVPN {
    param(
        [ValidateScript({
            if (!($_ | Test-Path)) { throw 'Config does not exist' }
            if ($_ -notlike '*.ovpn') { throw 'Config does not exist' }
            return $true
        })]
        [System.IO.FileInfo]$ConfigPath,
        [string]$InstallerURL = 'https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.8-I602-Win10.exe'
    )
    $LocalInstaller = "$env:temp\openvpn-install.exe"
    $ProgramPath = "$env:ProgramFiles\OpenVPN\config"
    Invoke-RestMethod $InstallerURL -OutFile $LocalInstaller
    Start-Process $LocalInstaller -ArgumentList '/S'
    if ($ConfigPath) { Copy-Item $ConfigPath $ProgramPath }
}