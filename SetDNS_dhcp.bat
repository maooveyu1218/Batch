@echo off
for /f "tokens=1* delims==" %%a in ('wmic nic where "NetEnabled=TRUE and not Name like '%%Virtual%%'" get NetConnectionID /value^|find "="') do set NetID=%%b
netsh interface ipv4 set dns name=%NetID% source=dhcp