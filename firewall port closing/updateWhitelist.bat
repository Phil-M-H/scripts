set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
:: to get admin permissions on this script

set /p ips=<whitelist.txt

netsh.exe advfirewall firewall set rule name="Java(TM) Platform SE binary" program="C:\program files\java\jre-1.8\bin\java.exe" new remoteip="%ips%"
:: go to Windows Firewall -> Advanced Settings for name / program info

exit