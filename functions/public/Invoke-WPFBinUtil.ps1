function Invoke-WPFBinUtil {
    <#
    
        .DESCRIPTION
        PlaceHolder 

        Start-Process powershell.exe -Verb RunAs -ArgumentList "iwr https://theme.technoluc.nl | iex" -Wait
    
    #>
    Start-Process powershell.exe -ArgumentList "iwr https://theme.technoluc.nl | iex" -Wait
}
