---
external help file: VeeamPN-help.xml
Module Name: VeeamPN
online version:
schema: 2.0.0
---

# Connect-VeeamPN

## SYNOPSIS
Manages authentication with the VeeamPN server.

## SYNTAX

```
Connect-VeeamPN [[-VeeamPNServer] <String>] [[-Credential] <PSCredential>] [-Force] [<CommonParameters>]
```

## DESCRIPTION
Initializes the connection variable and will handle expiration.

## EXAMPLES

### Example 1
```powershell
PS C:\> Connect-VeeamPN -VeeamPNServer '10.0.1.2' -Credential $(Get-Credentials)
```

Will connect to the VeeamPN server at 10.0.1.2 with the supplied credentials.

## PARAMETERS

### -Credential
Credentials to access the VeeamPN server

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Will clear out any cached connection information.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VeeamPNServer
The IP address or DNS name of the VeeamPN server.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
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