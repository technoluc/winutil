# TechnoLuc's Windows Utility
#### forked from Chris Titus Tech

## Open PowerShell as Administrator
### Launch Command:

```
iwr -useb https://win.technoluc.nl | iex
```

### [Download Tool](https://github.com/technoluc/winutil/releases/download/v1.0/TechnoLucsWinUtil.zip)

Added: 
- Notion
- Termius
- Minitool Partition Wizard
- NirSoft ShellExView
- Microsoft OfficeDeploymentTool

Personal favorite: 
Tweaks: Bin Utility 

The Microsoft OfficeDeploymentTool unpacks files in C:\Program Files\Office Deployment Tool. 

It also downloads;

1) a config.xml for installing OfficeProPlus21, excluding some apps and the preferred language (EN-US). 

2) the install.cmd command that opens the installer and passes the config.xml file to it for an unattended installation and 

3) a script created by ms.guides.com that activates Office 2021. 

