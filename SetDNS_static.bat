@echo off
for /f "tokens=1* delims==" %%a in ('wmic nic where "NetEnabled=TRUE and not Name like '%%Virtual%%'" get NetConnectionID /value^|find "="') do set NetID=%%b
netsh interface ipv4 set dns name=%NetID% source=static addr="192.168.0.11" register=primary validate=no
netsh interface ipv4 add dns name=%NetID% addr="192.168.0.22" index=2 validate=no