@echo off
chcp 65001 >nul
:: Uygulama
title Uno It Toolbox
set titlest=Uno It Toolbox - V0.3
setlocal enabledelayedexpansion

:: General
set general_backtomainmenu=Return to Main Menu
::#region:: Ana menü
set menuTITLE=Main Menu
set menu_system=System Information
set menu_network=Network Operations
set menu_printer=Printer Operations
set menu_disk=Disk Operations
set menu_security=Security Operations
set menu_exit=Exit
set menu_select=Select an operation number:
::#endregion
::#region:: Sistem Bilgileri
set systemInfTITLE=System Information
set systemInf_main=Active Username on the Computer
set systemInf_serial=Computer Serial Number
set systemInf_brand=Computer Brand and Model
set systemInf_hardware=Computer Hardware Information
set systemInf_lic=Windows License Status
:: alt
set systemInfAlt_11=Computer Name
set systemInfAlt_12=Username
set systemInfAlt_21=Serial number could not be retrieved
set systemInfAlt_31=Brand and model information could not be retrieved
::#endregion
::#region:: Ağ İşlemleri
set networkTITLE=Network Operations
set network_showip=View IP Address
set network_pingtest=Ping Test
set network_tracert=Tracert (Network Trace)
set network_telnet=Telnet (TNC)
set network_cleardnscache=Clear DNS Cache
:: alt
set networkAlt_enteripping=Enter an address for ping
set networkAlt_enteriptracert=Enter an address for tracert
::#endregion
::#region:: Yazıcı İşlemleri
set printerTITLE=Printer Operations
set printer_load=List Installed Printers
set printer_show=Show Printer Status
set printer_restart=Restart Printer
set printer_clear=Clear Printer Queue
::#endregion
::#region:: Disk İşlemleri
set diskTITLE=Disk Operations
set disk_check=Check Disk Status
set disk_scan=Scan Hard Drive
set disk_show=Show Storage Space
::#endregion
::#region:: Güvenlik İşlemleri
set securityTITLE=Security Operations
set security_firewallopen=Enable Firewall
set security_firewallclose=Disable Firewall
::#endregion

::#region:: main_menu
:main_menu
cls
echo  %titlest%
echo ================== %menuTITLE% ==================
echo 1. %menu_system%
echo 2. %menu_network%
echo 3. %menu_printer%
echo 4. %menu_disk%
echo 5. %menu_security%
echo 6. %menu_exit%
echo ============================================
set /p choice=%menu_select%

if "%choice%"=="1" goto system_menu
if "%choice%"=="2" goto network_menu
if "%choice%"=="3" goto printer_menu
if "%choice%"=="4" goto disk_menu
if "%choice%"=="5" goto security_menu
if "%choice%"=="6" exit

goto main_menu
::#endregion

::#region:: system_menu
:system_menu
cls
echo ================== %systemInfTITLE% ==================
echo 1. %systemInf_main%
echo 2. %systemInf_serial%
echo 3. %systemInf_brand%
echo 4. %systemInf_hardware%
echo 5. %systemInf_lic%
echo 6. %general_backtomainmenu%
echo ======================================================
set /p sys_choice=%menu_select%

if "%sys_choice%"=="1" (echo %systemInfAlt_11%: %COMPUTERNAME% && echo %systemInfAlt_12%: %USERNAME% && pause)
if "%sys_choice%"=="2" (
  wmic bios get serialnumber | find /v "SerialNumber" >nul 2>&1
  if %errorlevel%==0 (
    wmic bios get serialnumber | find /v "SerialNumber"
    ) else (
    echo %systemInfAlt_21%.
  )
  pause
)
if "%sys_choice%"=="3" (
  wmic computersystem get manufacturer,model | find /v "Manufacturer" >nul 2>&1
  if %errorlevel%==0 (
    wmic computersystem get manufacturer,model | find /v "Manufacturer"
    ) else (
    echo %systemInfAlt_31%.
  )
  pause
)
if "%sys_choice%"=="4" (systeminfo && pause)
if "%sys_choice%"=="5" (slmgr /xpr && pause)
if "%sys_choice%"=="6" goto main_menu

goto system_menu
::#endregion

::#region:: network_menu
:network_menu
cls
echo ================== %networkTITLE% ==================
echo 1. %network_showip%
echo 2. %network_pingtest%
echo 3. %network_tracert%
echo 4. %network_telnet%
echo 5. %network_cleardnscache%
echo 6. %general_backtomainmenu%
echo ===================================================
set /p net_choice=%menu_select%

if "%net_choice%"=="1" (ipconfig && pause)
if "%net_choice%"=="2" (set /p ip=%networkAlt_enteripping%: && ping %ip% && pause)
if "%net_choice%"=="3" (set /p tracert_ip=%networkAlt_enteriptracert%: && tracert %tracert_ip% && pause)
if "%net_choice%"=="4" (telnet && pause)
if "%net_choice%"=="5" (ipconfig /flushdns && pause)
if "%net_choice%"=="6" goto main_menu

goto network_menu
::#endregion

::#region:: printer_menu
:printer_menu
cls
echo ================== %printerTITLE% ==================
echo 1. %printer_load%
echo 2. %printer_show%
echo 3. %printer_restart%
echo 4. %printer_clear%
echo 5. %general_backtomainmenu%
echo ======================================================
set /p print_choice=%menu_select%

if "%print_choice%"=="1" (wmic printer list brief && pause)
if "%print_choice%"=="2" (wmic printer get name,status && pause)
if "%print_choice%"=="3" (net stop spooler && net start spooler && pause)
if "%print_choice%"=="4" (net stop spooler && del /q/f/s %systemroot%\System32\spool\PRINTERS\* && net start spooler && pause)
if "%print_choice%"=="5" goto main_menu

goto printer_menu
::#endregion

::#region:: disk_menu
:disk_menu
cls
echo ================== %diskTITLE% ==================
echo 1. %disk_check%
echo 2. %disk_scan%
echo 3. %disk_show%
echo 4. %general_backtomainmenu%
echo ================================================
set /p disk_choice=%menu_select%

if "%disk_choice%"=="1" (wmic diskdrive get status && pause)
if "%disk_choice%"=="2" (chkdsk && pause)
if "%disk_choice%"=="3" (wmic logicaldisk get size,freespace,caption && pause)
if "%disk_choice%"=="4" goto main_menu

goto disk_menu
::#endregion

::#region security_menu
:security_menu
cls
echo ================== %securityTITLE% ==================
echo 1. %security_firewallopen%
echo 2. %security_firewallclose%
echo 3. %general_backtomainmenu%
echo =========================================================
set /p sec_choice=%menu_select%

if "%sec_choice%"=="1" (netsh advfirewall set allprofiles state on && pause)
if "%sec_choice%"=="2" (netsh advfirewall set allprofiles state off && pause)
if "%sec_choice%"=="3" goto main_menu

goto security_menu
::#endregion
