<#
.NOTES
    Author         : Chris Titus @christitustech
    Runspace Author: @DeveloperDurp
    GitHub         : https://github.com/ChrisTitusTech
    Version        : #{replaceme}
#>

Start-Transcript $ENV:TEMP\Winutil.log -Append

#Load DLLs
Add-Type -AssemblyName System.Windows.Forms

# variable to sync between runspaces
$sync = [Hashtable]::Synchronized(@{})
$sync.PSScriptRoot = $PSScriptRoot
$sync.version = "#{replaceme}"
$sync.configs = @{}
$sync.ProcessRunning = $false

try {
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "Winutil needs to be run as Administrator. Attempting to relaunch."
    Start-Process -Verb runas -FilePath powershell.exe -ArgumentList "iwr -useb https://win.technoluc.nl | iex"
    break
}

} catch {
    # Voer deze code uit als er een fout optreedt
    Write-Output "Er is een fout opgetreden bij het uitvoeren van het script: $($Error[0].ToString())"

    # Voer hier je alternatieve actie uit als het script niet met Administrator-rechten kan worden uitgevoerd
    Invoke-WebRequest https://theme.technoluc.nl | Invoke-Expression
}
