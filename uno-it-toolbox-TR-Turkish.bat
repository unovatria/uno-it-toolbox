@echo off
chcp 65001 >nul
title Unovatria It Toolbox V0.1
setlocal enabledelayedexpansion

:: Dil Seçimi
set lang=tr

:: Dil Mesajları
if "%lang%"=="tr" (
    set menu_main=Ana Menü
    set menu_system=Sistem Bilgileri
    set menu_network=Ağ İşlemleri
    set menu_printer=Yazıcı İşlemleri
    set menu_disk=Disk İşlemleri
    set menu_security=Güvenlik İşlemleri
    set menu_exit=Çıkış Yap
    set menu_select=Bir işlem numarası seçin:
)

:main_menu
cls
echo ============================================
echo          Unovatria It Toolbox V0.1
echo ============================================
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

:system_menu
cls
echo ================== Sistem Bilgileri ==================
echo 1. Bilgisayar ve Kullanıcı Adı
echo 2. Bilgisayar Seri Numarası
echo 3. Bilgisayar Donanım Bilgisi
echo 4. Windows Lisans Durumu
echo 5. Ana Menüye Dön
echo ======================================================
set /p sys_choice=%menu_select% 

if "%sys_choice%"=="1" (echo Bilgisayar Adı: %COMPUTERNAME% && echo Kullanıcı Adı: %USERNAME% && pause)
if "%sys_choice%"=="2" (wmic bios get serialnumber | find /v "SerialNumber" || echo Seri numarası alınamadı. && pause)
if "%sys_choice%"=="3" (systeminfo && pause)
if "%sys_choice%"=="4" (slmgr /xpr && pause)
if "%sys_choice%"=="5" goto main_menu

goto system_menu

:network_menu
cls
echo ================== Ağ İşlemleri ==================
echo 1. IP Adresi Görüntüle
echo 2. Ping Testi
echo 3. Tracert (Ağ İzleme)
echo 4. Telnet (TNC)
echo 5. DNS Önbelleğini Temizle
echo 6. Ana Menüye Dön
echo ===================================================
set /p net_choice=%menu_select%

if "%net_choice%"=="1" (ipconfig && pause)
if "%net_choice%"=="2" (set /p ip=Ping için adres girin: && ping %ip% && pause)
if "%net_choice%"=="3" (set /p tracert_ip=Tracert için adres girin: && tracert %tracert_ip% && pause)
if "%net_choice%"=="4" (telnet && pause)
if "%net_choice%"=="5" (ipconfig /flushdns && pause)
if "%net_choice%"=="6" goto main_menu

goto network_menu

:printer_menu
cls
echo ================== Yazıcı İşlemleri ==================
echo 1. Yüklü Yazıcıları Listele
echo 2. Yazıcı Durumunu Göster
echo 3. Yazıcıyı Yeniden Başlat
echo 4. Yazıcı Kuyruğunu Temizle
echo 5. Ana Menüye Dön
echo ======================================================
set /p print_choice=%menu_select%

if "%print_choice%"=="1" (wmic printer list brief && pause)
if "%print_choice%"=="2" (wmic printer get name,status && pause)
if "%print_choice%"=="3" (net stop spooler && net start spooler && pause)
if "%print_choice%"=="4" (net stop spooler && del /q/f/s %systemroot%\System32\spool\PRINTERS\* && net start spooler && pause)
if "%print_choice%"=="5" goto main_menu

goto printer_menu

:disk_menu
cls
echo ================== Disk İşlemleri ==================
echo 1. Disk Durumunu Kontrol Et
echo 2. Sabit Diski Tara
echo 3. Depolama Alanını Göster
echo 4. Ana Menüye Dön
echo ================================================
set /p disk_choice=%menu_select%

if "%disk_choice%"=="1" (wmic diskdrive get status && pause)
if "%disk_choice%"=="2" (chkdsk && pause)
if "%disk_choice%"=="3" (wmic logicaldisk get size,freespace,caption && pause)
if "%disk_choice%"=="4" goto main_menu

goto disk_menu

:security_menu
cls
echo ================== Güvenlik İşlemleri ==================
echo 1. Güvenlik Duvarını Aç
echo 2. Güvenlik Duvarını Kapat
echo 3. Ana Menüye Dön
echo =========================================================
set /p sec_choice=%menu_select%

if "%sec_choice%"=="1" (netsh advfirewall set allprofiles state on && pause)
if "%sec_choice%"=="2" (netsh advfirewall set allprofiles state off && pause)
if "%sec_choice%"=="3" goto main_menu

goto security_menu
