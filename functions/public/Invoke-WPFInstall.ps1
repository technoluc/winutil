function Invoke-WPFInstall {
    <#
    
        .DESCRIPTION
        PlaceHolder
    
    #>

    if($sync.ProcessRunning){
        $msg = "Install process is currently running."
        [System.Windows.MessageBox]::Show($msg, "Winutil", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
        return
    }

    $WingetInstall = Get-WinUtilCheckBoxes -Group "WPFInstall"

    if ($wingetinstall.Count -eq 0) {
        $WarningMsg = "Please select the program(s) to install"
        [System.Windows.MessageBox]::Show($WarningMsg, $AppTitle, [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
        return
    }

    Invoke-WPFRunspace -ArgumentList $WingetInstall -scriptblock {
        param($WingetInstall)
        try{
            If ( $wingetinstall -eq "Microsoft.OfficeDeploymentTool" ) {
                $wingetResult.Add("Please execute install.cmd as Administrator from C:\Program Files\OfficeDeploymentTool. After installation completes execute activate.cmd")
                Start-Process powershell.exe -Verb RunAs -ArgumentList "-command iwr -outf 'C:\Program Files\OfficeDeploymentTool\config.xml' 'https://github.com/technoluc/winutil/raw/main/office/deploymentconfig.xml' ; iwr -outf 'C:\Program Files\OfficeDeploymentTool\install.cmd' 'https://github.com/technoluc/winutil/raw/main/office/deploymentinstall.cmd' ; iwr -outf 'C:\Program Files\OfficeDeploymentTool\activate.cmd' 'https://github.com/technoluc/winutil/raw/main/office/ActivateOffice21.cmd'" -Wait
            }
            
            $sync.ProcessRunning = $true

            # Ensure winget is installed
            Install-WinUtilWinget

            # Install all winget programs in new window
            Install-WinUtilProgramWinget -ProgramsToInstall $WingetInstall

            $ButtonType = [System.Windows.MessageBoxButton]::OK
            $MessageboxTitle = "Installs are Finished "
            $Messageboxbody = ("Done")
            $MessageIcon = [System.Windows.MessageBoxImage]::Information
        
            [System.Windows.MessageBox]::Show($Messageboxbody, $MessageboxTitle, $ButtonType, $MessageIcon)

            Write-Host "==========================================="
            Write-Host "--      Installs have finished          ---"
            Write-Host "==========================================="
        }
        Catch {
            Write-Host "==========================================="
            Write-Host "--      Winget failed to install        ---"
            Write-Host "==========================================="
        }
        $sync.ProcessRunning = $False
    }
}