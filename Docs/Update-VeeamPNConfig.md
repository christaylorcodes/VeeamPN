---
external help file: VeeamPN-help.xml
Module Name: VeeamPN
online version:
schema: 2.0.0
---

# Update-VeeamPNConfig

## SYNOPSIS
Will update a config with route and DNS information.

## SYNTAX

```
Update-VeeamPNConfig [-Config] <String> [[-Routes] <Hashtable>] [[-DNS] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Will update a config with some additional route and DNS information to allow a typical endpoint to work correctly.

## EXAMPLES

### Example 1
```powershell
$Routes = @{
    '10.0.1.0' = '255.255.255.0'
    '10.0.2.0' = '255.255.255.0'
}
$DNS = @('10.0.1.12','10.0.2.12')
Update-VeeamPNConfig -Config "$env:TEMP\NewClient.ovpn" -Routes $Routes -DNS $DNS
```

Updates the NewClient config with route and DNS information.

## PARAMETERS

### -Config
Path to the OpenVPN config you want to update.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DNS
An array of DNS servers

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Routes
A [hashtable] with the network as the key and the subnet as the value.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[https://christaylor.codes](https://christaylor.codes)
