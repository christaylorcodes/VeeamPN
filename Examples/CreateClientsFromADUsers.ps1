# Used to add a client and download the config for AD users

# VeeamPN server info
$VeeamPNServer = '10.0.1.2'
$Credentials = Get-Credential

# AD group too look for users
$Group = 'employees'
$Days = 30

# Where to save the VPN configs
$ConfigDirectory = 'C:\Temp'

# You will most likely need to add some route/DNS information
$Routes = @{
    '10.0.1.0' = '255.255.255.0'
    '10.0.2.0' = '255.255.255.0'
}
$DNS = @('10.0.1.12','10.0.2.12')

Install-Module VeeamPN
Import-Module VeeamPN

# Get AD users
try { $AllUsers = Get-ADUser -Filter * -Properties emailaddress, lastlogon -ErrorAction Stop }
catch [System.Management.Automation.CommandNotFoundException] { Write-Error 'Run this on a computer with AD tools' -ErrorAction Stop }
catch { throw }

# AD Group used to filter users
$GroupUsers = Get-ADGroupMember $Group

# Filter conditions
$UserList = $AllUsers | Where-Object {$_.enabled -eq $true `
    -and $GroupUsers.name -contains $_.name `
    -and $_.EmailAddress `
    -and $_.lastlogon `
    -and $(Get-Date $_.lastlogon -UFormat %x) -gt $((Get-Date).AddDays(-$Days))}

# Connect to the VeeamPN server
Connect-VeeamPN -VeeamPNServer $VeeamPNServer -Credential $Credentials -ErrorAction Stop

$Clients = Get-VeeamPNClient

foreach($User in $UserList){
    # Check if client has already been adeed
    if($Clients.name -contains $User.EmailAddress){
        $Client = $Clients | Where-Object {$_.name -eq $User.EmailAddress}
        $ID = $Client.id
    }
    else {
        # Add new client
        Write-Verbose "Adding $($User.EmailAddress)"
        $Result = New-VeeamPNClient -ClientName $User.EmailAddress
        $ID = $Result.id

        # Refresh client list
        $Clients = Get-VeeamPNClient
    }

    Write-Verbose "Saving config for $($User.EmailAddress)"
    $ConfigPath = Get-VeeamPNClientConfig -ID $ID -OutputPath $ConfigDirectory

    # modify config to add routes and dns
    Update-VeeamPNConfig -Config $ConfigPath -Routes $Routes -DNS $DNS
}