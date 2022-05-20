# TechnoLuc's Windows Utility
#### forked from Chris Titus Tech

I have added the Microsoft OfficeDeploymentTool. This unpacks some files in C:\Program Files\Office Deployment Tool. 
It also downloads a couple of files;

1) a configurstion file containing the options like installing OfficeProPlus21, excluding some apps and the prefered language. 

2) the install.cmd command that opens the installer and passes the config.xml file to it for an unattended installation and 

3) a script created by ms.guides.com that activates Office 2021. 

I also added the Minitool Partition Wizard (Free) and Notion

## Open PowerShell as Administrator
### Launch Command:

```
iwr -useb https://win.technoluc.nl | iex
```
