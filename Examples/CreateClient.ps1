$VeeamPNServer = '10.0.1.2'
$Credentials = Get-Credential
$NewClient = 'TestClient'
$ConfigPath = $env:TEMP

# Routes are added as a [hashtable] with the network as the key and the mask as the value
$Routes = @{
    '10.0.1.0' = '255.255.255.0'
    '10.0.2.0' = '255.255.255.0'
}

# DNS servers are listed as an array
$DNS = @('10.0.1.12','10.0.2.12')

# Install the module
Install-Module VeeamPN
Import-Module VeeamPN

# Authenticate to VeeamPN server
Connect-VeeamPN -VeeamPNServer $VeeamPNServer -Credential $Credentials

# Get a list of your current clients
Get-VeeamPNClient | Out-GridView

# Add a new agent
$Result = New-VeeamPNClient -ClientName $NewClient

# Download the VPN config for our new client
Get-VeeamPNClientConfig -ID $Result.id -OutputPath $ConfigPath -Verbose

# The default config will not have enough information to work in most cases.
# We will need to modify the config with route and DNS information
Update-VeeamPNConfig -Config "$ConfigPath\$($NewClient).ovpn" -Routes $Routes -DNS $DNS

# Install OpenVPN and add TestClient config
Install-OpenVPN -ConfigPath "$ConfigPath\$($NewClient).ovpn"