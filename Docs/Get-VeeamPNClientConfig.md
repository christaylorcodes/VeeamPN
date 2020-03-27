---
external help file: VeeamPN-help.xml
Module Name: VeeamPN
online version:
schema: 2.0.0
---

# Get-VeeamPNClientConfig

## SYNOPSIS
Will download the OpenVPN config for the given client.

## SYNTAX

```
Get-VeeamPNClientConfig [-ID] <Int32> [[-OutputPath] <String>] [-Force] [-NoClobber] [<CommonParameters>]
```

## DESCRIPTION
Will download an ovpn file that can be used to configure the OpenVPN client.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-VeeamPNClientConfig -ID 1 -OutputPath $env:TEMP
```

Will download the config for client 1 to the temp directory.

## PARAMETERS

### -Force
Indicates that the cmdlet overwrites an existing read-only file. Even using the Force parameter, the cmdlet cannot override security restrictions.

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

### -ID
The ID of the VeeamPN client you want to download.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoClobber
Indicates that the cmdlet will not overwrite an existing file. By default, if a file exists in the specified path, Get-VeeamPNClientConfig overwrites the file without warning.

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

### -OutputPath
The path that the ovpn file will be saved.

```yaml
Type: String
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
