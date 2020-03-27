---
external help file: VeeamPN-help.xml
Module Name: VeeamPN
online version:
schema: 2.0.0
---

# New-VeeamPNClient

## SYNOPSIS
Will create a new endpoint client.

## SYNTAX

```
New-VeeamPNClient [-ClientName] <String> [-DefaultGateway] [<CommonParameters>]
```

## DESCRIPTION
Will use the web API to create a new endpoint client.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-VeeamPNClient -ClientName 'NewClient'
```

Well create a new endpoint client named 'NewClient'

## PARAMETERS

### -ClientName
A unique name for the client.

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

### -DefaultGateway
This setting will disable split tunneling.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[https://christaylor.codes](https://christaylor.codes)
