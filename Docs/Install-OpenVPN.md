---
external help file: VeeamPN-help.xml
Module Name: VeeamPN
online version:
schema: 2.0.0
---

# Install-OpenVPN

## SYNOPSIS
Will download, install and configure OpenVPN

## SYNTAX

```
Install-OpenVPN [[-ConfigPath] <FileInfo>] [[-InstallerURL] <String>] [<CommonParameters>]
```

## DESCRIPTION
Will download the OpenVPN agent and set the given config as a machine wide profile.

## EXAMPLES

### Example 1
```powershell
PS C:\> Install-OpenVPN -ConfigPath "$env:Temp\NewClient.ovpn"
```

Installs OpenVPN and configures with the given config.

## PARAMETERS

### -ConfigPath
Path to a config you want preloaded.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallerURL
Give an alternate download URL for OpenVPN

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
