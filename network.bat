@echo off
NETSH WINSOCK RESET
netsh advfirewall reset
NETSH INTERFACE IPV4 RESET
NETSH INTERFACE IPV6 RESET
NETSH INTERFACE TCP RESET
NETSH INTERFACE IP RESET
NETSH INTERFACE TCP RESET
netsh rpc reset
netsh branchcache reset

netcfg -d
devcon.exe rescan

echo NEED TO WAIT UR INTERNET BACK (click any key to continue now) 
pause
WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL DISABLE
WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL ENABLE
wmic path Win32_PNPEntity where "caption like '%bluetooth%' AND DeviceID like 'USB\\%'" call disable
echo Done..
pause
exit


