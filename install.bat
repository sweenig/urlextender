@echo off
goto:start
urlextend - Compiled by Stuart Weenig (http://stuart.weenig.com)
Original code written by James Clements - james@jjclements.co.uk http://www.jjclements.co.uk/2010/03/13/ssh-scp-hyperlink/
MUST BE RUN AS ADMINISTRATOR
:start
:ssh
echo Building ssh:// protocol handler...
echo var server=(WScript.Arguments(0))>C:\Windows\hyperlink-ssh.js
echo var prefix='ssh://'>>C:\Windows\hyperlink-ssh.js
echo var app='C:\\Windows\\SysWOW64\\putty.exe'>>C:\Windows\hyperlink-ssh.js
echo server=server.replace(prefix, '')>>C:\Windows\hyperlink-ssh.js
echo server=server.replace('/', '')>>C:\Windows\hyperlink-ssh.js
echo var shell = new ActiveXObject("WScript.Shell")>>C:\Windows\hyperlink-ssh.js
echo shell.Exec(app + " " + server)>>C:\Windows\hyperlink-ssh.js
echo Installing putty...
move /Y putty.exe C:\WINDOWS\SysWOW64
echo Registering SSH URL association...
reg add "HKCR\ssh" /f /v "" /t REG_SZ /d "URL:SSH Connection" > nul
reg add "HKCR\ssh" /f /v "URL Protocol" /t REG_SZ /d "" > nul
reg add "HKCR\ssh\DefaultIcon" /f /v "" /t REG_SZ /d "C:\WINDOWS\SysWOW64\putty.exe" > nul
reg add "HKCR\ssh\shell\open\command" /f /v "" /t REG_SZ /d "wscript.exe C:\WINDOWS\hyperlink-ssh.js %%1" > nul
:scp
echo Building scp:// protocol handler...
echo var server=(WScript.Arguments(0))>C:\Windows\hyperlink-scp.js
echo var prefix='scp://'>>C:\Windows\hyperlink-scp.js
echo var app='C:\\WINDOWS\\SysWOW64\\winscp.exe'>>C:\Windows\hyperlink-scp.js
echo server=server.replace(prefix, '')>>C:\Windows\hyperlink-scp.js
echo server=server.replace('/', '')>>C:\Windows\hyperlink-scp.js
echo var shell = new ActiveXObject("WScript.Shell")>>C:\Windows\hyperlink-scp.js
echo shell.Exec(app + " " + server)>>C:\Windows\hyperlink-scp.js
echo Installing WinSCP...
move /Y WinSCP.exe C:\WINDOWS\SysWOW64\winscp.exe
echo Registering SCP URL association...
reg add "HKCR\scp" /f /v "" /t REG_SZ /d "URL:SCP Connection" > nul
reg add "HKCR\scp" /f /v "URL Protocol" /t REG_SZ /d "" > nul
reg add "HKCR\scp\DefaultIcon" /f /v "" /t REG_SZ /d "C:\WINDOWS\SysWOW64\winscp.exe" > nul
reg add "HKCR\scp\shell\open\command" /f /v "" /t REG_SZ /d "wscript.exe C:\WINDOWS\hyperlink-scp.js %%1" > nul
:rdp
echo Building rdp:// protocol handler...
echo var server=(WScript.Arguments(0))>C:\Windows\hyperlink-rdp.js
echo var prefix='rdp://'>>C:\Windows\hyperlink-rdp.js
echo var app='C:\\WINDOWS\\system32\\mstsc.exe'>>C:\Windows\hyperlink-rdp.js
echo server=server.replace(prefix, '')>>C:\Windows\hyperlink-rdp.js
echo server=server.replace('/', '')>>C:\Windows\hyperlink-rdp.js
echo var shell = new ActiveXObject("WScript.Shell")>>C:\Windows\hyperlink-rdp.js
echo shell.Exec(app + " /v:" + server)>>C:\Windows\hyperlink-rdp.js
echo Registering RDP URL association...
reg add "HKCR\rdp" /f /v "" /t REG_SZ /d "URL:Remote Desktop Connection" > nul
reg add "HKCR\rdp" /f /v "URL Protocol" /t REG_SZ /d "" > nul
reg add "HKCR\rdp\DefaultIcon" /f /v "" /t REG_SZ /d "C:\WINDOWS\System32\mstsc.exe" > nul
reg add "HKCR\rdp\shell\open\command" /f /v "" /t REG_SZ /d "wscript.exe C:\WINDOWS\hyperlink-rdp.js %%1" > nul
:finish
pause
