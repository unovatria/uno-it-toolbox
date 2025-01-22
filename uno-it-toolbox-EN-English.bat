@echo off
chcp 65001 >nul
:: Uygulama
title Uno It Toolbox
set titlest=Uno It Toolbox - V0.4
setlocal enabledelayedexpansion

::#region::: START OF LANGUAGE SECTION

:: General
set general_backtomainmenu=Return to Main Menu
::#region:: Ana menü
set menuTITLE=Main Menu
set menu_system=System Information
set menu_hardware=Hardware Operations
set menu_network=Network Operations
set menu_printer=Printer Operations
set menu_disk=Disk Operations
set menu_security=Security Operations
set menu_shutdown=Shut Down Computer
set menu_restart=Restart Computer
set menu_exit=Exit
set menu_select=Select an operation number:
::#endregion
::#region:: Sistem Bilgileri
set systemInfTITLE=System Information
set systemInf_main=View General System Information
set systemInf_username=Active Username on the Computer
set systemInf_serial=Computer Serial Number
set systemInf_brand=Computer Brand and Model
set systemInf_accounts=List User Accounts
set systemInf_lic=Windows License Status
set systemInf_showlic=Show Windows License
set systemInf_winver=Windows Version Information
set systemInf_updatestatus=Show Windows Update Status
set systemInf_updatestoreapps=Update Windows Store Apps
set systemInf_systemrepair=Repair Windows System Files
:: alt
set systemInfAlt_11=Computer Name
set systemInfAlt_12=Username
set systemInfAlt_21=Serial number could not be retrieved
set systemInfAlt_31=Brand and model information could not be retrieved
set systemInfAlt_81=Update information could not be retrieved
::#endregion
::#region:: Donanım İşlemleri
set hardwareTITLE=Hardware Operations
set hardware_cpu=Show CPU Information
set hardware_ram=Show Memory (RAM) Usage
set hardware_info=Computer Hardware Information
::#endregion
::#region:: Ağ İşlemleri
set networkTITLE=Network Operations
set network_showip=Show IP Address
set network_all=View Full IP Configuration
set network_release=Release IP Configuration
set network_renew=Renew IP Configuration
set network_cleardnscache=Clear DNS Cache
set network_pingtest=Ping Test
set network_tracert=Tracert (Network Monitoring)
set network_telnet=Telnet (TNC)
set network_password=Show Connected Wi-Fi Password
:: alt
set networkAlt_enteripping=Enter address for ping
set networkAlt_enteriptracert=Enter address for tracert
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
set disk_cleanmgr=Perform Windows Disk Cleanup
set disk_cleantemp=Delete Temporary Files
::#endregion
::#region:: Güvenlik İşlemleri
set securityTITLE=Security & BIOS Operations
set security_firewallopen=Enable Firewall
set security_firewallclose=Disable Firewall
set security_openbios=Open BIOS Settings
set security_startsafe=Start in Safe Mode
set security_grouppolicy=Update Group Policies (gpupdate /force)
::#endregion

::#endregion::: END OF LANGUAGE SECTION



::#region::: START OF MENUS SECTION

::#region:: main_menu
:main_menu
cls
echo  %titlest%
echo ================== %menuTITLE% ==================
echo 1. %menu_system%
echo 2. %menu_hardware%
echo 3. %menu_network%
echo 4. %menu_printer%
echo 5. %menu_disk%
echo 6. %menu_security%
echo.
echo 11. %menu_shutdown%
echo 12. %menu_restart%
echo.
echo X. %menu_exit%
echo ============================================
set /p choice=%menu_select%

if "%choice%"=="1" goto system_menu
if "%choice%"=="2" goto hardware_menu
if "%choice%"=="3" goto network_menu
if "%choice%"=="4" goto printer_menu
if "%choice%"=="5" goto disk_menu
if "%choice%"=="6" goto security_menu
if "%choice%"=="11" (shutdown /s && pause)
if "%choice%"=="12" (shutdown /r && pause)
if /I "%choice%"=="X" exit

goto main_menu
::#endregion

::#region:: system_menu
:system_menu
cls
echo ================== %systemInfTITLE% ==================
echo 1. %systemInf_main%
echo 2. %systemInf_username%
echo 3. %systemInf_serial%
echo 4. %systemInf_brand%
echo 5. %systemInf_accounts%
echo 6. %systemInf_lic%
echo 7. %systemInf_showlic%
echo 8. %systemInf_winver%
echo 9. %systemInf_updatestatus%
echo 10. %systemInf_updatestoreapps%
echo 11. %systemInf_systemrepair%
echo.
echo X. %general_backtomainmenu%
echo ======================================================
set /p sys_choice=%menu_select%

if "%sys_choice%"=="1" (msinfo32 && pause)
if "%sys_choice%"=="2" (echo %systemInfAlt_11%: %COMPUTERNAME% && echo %systemInfAlt_12%: %USERNAME% && pause)
if "%sys_choice%"=="3" (
  wmic bios get serialnumber | find /v "SerialNumber" >nul 2>&1
  if %errorlevel%==0 (
    wmic bios get serialnumber | find /v "SerialNumber"
    ) else (
    echo %systemInfAlt_21%.
  )
  pause
)
if "%sys_choice%"=="4" (
  wmic computersystem get manufacturer,model | find /v "Manufacturer" >nul 2>&1
  if %errorlevel%==0 (
    wmic computersystem get manufacturer,model | find /v "Manufacturer"
    ) else (
    echo %systemInfAlt_31%.
  )
  pause
)
if "%sys_choice%"=="5" (net user && pause)
if "%sys_choice%"=="6" (slmgr /xpr && pause)
if "%sys_choice%"=="7" (slmgr /dlv && pause)
if "%sys_choice%"=="8" (start winver && pause)
if "%sys_choice%"=="9" (wmic qfe get HotfixID,InstalledOn || echo %systemInfAlt_81%. && pause)
if "%sys_choice%"=="10" (start ms-windows-store://update && pause)
if "%sys_choice%"=="11" (sfc /scannow && pause)

if /I "%sys_choice%"=="X" goto main_menu

goto system_menu
::#endregion

::#region:: hardware_menu
:hardware_menu
cls
echo ================== %hardwareTITLE% ==================
echo 1. %hardware_cpu%
echo 2. %hardware_ram%
echo 3. %hardware_info%
echo.
echo X. %general_backtomainmenu%
echo ======================================================
set /p hardware_choice=%menu_select%

if "%hardware_choice%"=="1" (wmic cpu get name,CurrentClockSpeed && pause)
if "%hardware_choice%"=="2" (wmic OS get FreePhysicalMemory && pause)
if "%hardware_choice%"=="3" (systeminfo && pause)
if /I "%hardware_choice%"=="X" goto main_menu

goto hardware_menu
::#endregion

::#region:: network_menu
:network_menu
cls
echo ================== %networkTITLE% ==================
echo 1. %network_showip%
echo 2. %network_all%
echo 3. %network_release%
echo 4. %network_renew%
echo 5. %network_cleardnscache%
echo 6. %network_pingtest%
echo 7. %network_tracert%
echo 8. %network_telnet%
echo 9. %network_password%
echo.
echo X. %general_backtomainmenu%
echo ===================================================
set /p net_choice=%menu_select%

if "%net_choice%"=="1" (ipconfig && pause)
if "%net_choice%"=="2" (ipconfig /all && pause)
if "%net_choice%"=="3" (ipconfig /release && pause)
if "%net_choice%"=="4" (ipconfig /renew && pause)
if "%net_choice%"=="5" (ipconfig /flushdns && pause)
if "%net_choice%"=="6" (set /p ip=%networkAlt_enteripping%: && ping %ip% && pause)
if "%net_choice%"=="7" (set /p tracert_ip=%networkAlt_enteriptracert%: && tracert %tracert_ip% && pause)
if "%net_choice%"=="8" (telnet && pause)
if "%net_choice%"=="9" (netsh wlan show profile name=* key=clear && pause)
if /I "%net_choice%"=="X" goto main_menu

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
echo.
echo X. %general_backtomainmenu%
echo ======================================================
set /p print_choice=%menu_select%

if "%print_choice%"=="1" (wmic printer list brief && pause)
if "%print_choice%"=="2" (wmic printer get name,status && pause)
if "%print_choice%"=="3" (net stop spooler && net start spooler && pause)
if "%print_choice%"=="4" (net stop spooler && del /q/f/s %systemroot%\System32\spool\PRINTERS\* && net start spooler && pause)
if /I "%print_choice%"=="X" goto main_menu

goto printer_menu
::#endregion

::#region:: disk_menu
:disk_menu
cls
echo ================== %diskTITLE% ==================
echo 1. %disk_check%
echo 2. %disk_scan%
echo 3. %disk_show%
echo 4. %disk_cleanmgr%
echo 5. %disk_cleantemp%
echo.
echo X. %general_backtomainmenu%
echo ================================================
set /p disk_choice=%menu_select%

if "%disk_choice%"=="1" (wmic diskdrive get status && pause)
if "%disk_choice%"=="2" (chkdsk && pause)
if "%disk_choice%"=="3" (wmic logicaldisk get size,freespace,caption && pause)
if "%disk_choice%"=="4" (cleanmgr && pause)
if "%disk_choice%"=="5" (del /q/f/s %temp%\* && pause)
if /I "%disk_choice%"=="X" goto main_menu

goto disk_menu
::#endregion

::#region security_menu
:security_menu
cls
echo ================== %securityTITLE% ==================
echo 1. %security_firewallopen%
echo 2. %security_firewallclose%
echo 3. %security_openbios%
echo 4. %security_startsafe%
echo 5. %security_grouppolicy%
echo.
echo X. %general_backtomainmenu%
echo =========================================================
set /p sec_choice=%menu_select%

if "%sec_choice%"=="1" (netsh advfirewall set allprofiles state on && pause)
if "%sec_choice%"=="2" (netsh advfirewall set allprofiles state off && pause)
if "%sec_choice%"=="3" (start ms-settings:recovery && pause)
if "%sec_choice%"=="4" (bcdedit /set {default} safeboot minimal && shutdown /r && pause)
if "%sec_choice%"=="5" (gpupdate /force && pause)
if /I "%sec_choice%"=="X" goto main_menu

goto security_menu
::#endregion

::#endregion::: END OF MENUS SECTION
