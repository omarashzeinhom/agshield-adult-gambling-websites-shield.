#!/bin/bash 
@ECHO OFF
CLS 
TITLE = Block Adult and Gambling Windows by andgoedu

ECHO 1. Changing_hosts_file
ECHO 2. CleanBrowsing_Family_Win10
ECHO 3. Family_Shield_CleanBrowsing_Win_7
ECHO 4. DNS_CloudFlare_Family_Win10
ECHO 5. CloudFlareDNS_Family_Shield_Win_7
ECHO 6. GoogleDNS_Win7
ECHO 7. GoogleDNS_Win10
ECHO 8. Check_DNS_Servers 



CHOICE /C 12345678 /M "Enter your choice:"



:: Note - list ERRRORLEVELS in decreasing order

IF ERRORLEVEL 8 GOTO Check_DNS_Servers 
IF ERRORLEVEL 7 GOTO GoogleDNS_Win10
IF ERRORLEVEL 6 GOTO GoogleDNS_Win7
IF ERRORLEVEL 5 GOTO DNS_CloudFlare_Family_Win10
IF ERRORLEVEL 4 GOTO DNS_CloudFlare_Family_Win10
IF ERRORLEVEL 3 GOTO Family_Shield_CleanBrowsing_Win_7
IF ERRORLEVEL 2 GOTO CleanBrowsing_Family_Win10
IF ERRORLEVEL 1 GOTO hostsfile

GOTO START
:hostsfile
    ECHO "Copying the original Windows Hosts file "
    PAUSE
    CD C:\Users\Public\Documents
    MKDIR OriginalFile
    CD
    CD C:\Windows\System32\drivers\etc
    %SystemRoot%\System32\xcopy.exe hosts C:\Users\Public\Documents\OriginalFile
    ECHO "Your original hosts was copied To C:\Users\Public\Documents\OriginalFile" 
    PAUSE
    ECHO "Deleting Old hosts file .............................................................." 
    DEL C:\Windows\System32\drivers\etc\hosts 
    ECHO "Deleting Old hosts file .............................................................." 
    %SystemRoot%\System32\xcopy.exe "%~dp0\hosts" "C:\Windows\System32\drivers\etc" /w 
    ECHO "Your Hosts File Was Changed SuccessFully" 
    PAUSE
    CLS
REM This Script Just Changes the hosts file to the family safe host file
GOTO END

GOTO START
:CleanBrowsing_Family_Win10
    ECHO "Changing Search Engine Results to Safe Family CleanBrowsing"
    ECHO  ".............Changing IPV4 DNS Of This PC-Only Wifi CleanBrowsing ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Wi-Fi" static  185.228.168.168 primary 
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Wi-Fi" 185.228.169.168 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Wifi CleanBrowsing ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Wi-Fi" static 2a0d:2a00:1:: primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Wi-Fi" 2a0d:2a00:2:: index=2 
    ECHO  ".............Changing IPV4 DNS Of This PC-Only Ethernet CleanBrowsing ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Ethernet" static  185.228.168.168 primary 
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Ethernet" 185.228.169.168 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Ethernet CleanBrowsing ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Wi-Fi" static  2a0d:2a00:1:: primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Wi-Fi" 2a0d:2a00:2:: index=2 
    ECHO  ".............Changing IPV4 DNS Of This PC-Only Local Area Connection CleanBrowsing ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Local Area Connection" static  185.228.168.168 primary  
    %SystemRoot%\System32\netsh.exe  interface ipv4 add dnsservers "Local Area Connection" 185.228.169.168 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Local Area Connection CleanBrowsing ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Local Area Connection" static 2a0d:2a00:1:: primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Local Area Connection" 2a0d:2a00:2:: index=2 
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "...................Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "....................Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO ".......................Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS    

GOTO END

GOTO START
:Family_Shield_CleanBrowsing_Win_7
    ECHO "Windows 7 Ethernet"
    %SystemRoot%\System32\netsh.exe interface ip set dns "Ethernet" static 185.228.168.168 primary
    %SystemRoot%\System32\netsh.exe interface ip add dns "Ethernet"  185.228.169.168 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Ethernet" static 2a0d:2a00:1:: primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add  dns "Ethernet"  2a0d:2a00:2::index=2        
    ECHO "Win7 Wifi"
    %SystemRoot%\System32\netsh.exe interface ip set dns "Wi-Fi" static 185.228.168.168 primary
    %SystemRoot%\System32\netsh.exe interface ip add  dns "Wi-Fi" 185.228.169.168 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add  dns "Wi-Fi" 2a0d:2a00:2::index=2 
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO "Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS    
GOTO END


GOTO START
:DNS_CloudFlare_Family_Win10
    ECHO "Changing Search Engine Results to Safe Family CloudFlare_Family_Win10"
    ECHO  ".............Changing IPV4 DNS Of This PC-Only CloudFlare_Family_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Wi-Fi" static 1.1.1.3 primary 
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Wi-Fi" 1.0.0.3 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Wifi CloudFlare_Family_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Wi-Fi" static 2606:4700:4700::1113 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Wi-Fi" 2606:4700:4700::1003 index=2
    ECHO  ".............Changing IPV4 DNS Of This PC-Only Ethernet CloudFlare_Family_Win10..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Ethernet" static 1.1.1.3 primary 
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Ethernet" 1.0.0.3 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Ethernet CloudFlare_Family_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Wi-Fi" static 2606:4700:4700::1113 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Wi-Fi" 2606:4700:4700::1113 primary
    ECHO  ".............Changing IPV4 DNS Of This PC-Only Local Area Connection CloudFlare_Family_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Local Area Connection" static  1.1.1.3 primary  
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Local Area Connection" 1.0.0.3 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Local Area Connection CloudFlare_Family_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Local Area Connection" static 2606:4700:4700::1113 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Local Area Connection" 2606:4700:4700::1003 index=2
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "...................Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "....................Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO ".......................Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS    
    ECHO "Changing Search Engine Results to Safe Family (CloudFlare Family DNS)."
    ECHO  " Changing DNS Of This PC-Only Wifi..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dns "Wi-Fi" 1.1.1.3 primary
    %SystemRoot%\System32\netsh.exe interface ipv4 add dns "Wi-Fi" 1.0.0.3 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Wi-Fi" 2606:4700:4700::1113 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dns "Wi-Fi" 2606:4700:4700::1003 index=2
    ECHO  " Changing DNS Of This PC-Only Ethernet ..............................................................."
    %SystemRoot%\System32\netsh.exe interface ipv4 set dns "Wired Ethernet Connection" 1.1.1.3 primary
    %SystemRoot%\System32\netsh.exe interface ipv4 add dns "Wired Ethernet Connection" 1.0.0.3 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Wired Ethernet Connection" 2606:4700:4700::1113 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dns "Wired Ethernet Connection" 2606:4700:4700::1003 index=2
    ECHO " Changing DNS Of This PC-Only Local Area Connection.............................................."
    %SystemRoot%\System32\netsh.exe interface ipv4 set dns "Local Area Connection" 1.1.1.3 primary
    %SystemRoot%\System32\netsh.exe interface ipv4 add dns "Local Area Connection" 1.0.0.3 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Local Area Connection" 2606:4700:4700::1113 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add dns "Local Area Connection" 2606:4700:4700::1003 index=2
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO "Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS

GOTO END

GOTO START
:CloudFlareDNS_Family_Shield_Win_7
   ECHO "Windows 7 Ethernet"
    %SystemRoot%\System32\netsh.exe interface ip set dns "Ethernet" static 1.1.1.3  primary
    %SystemRoot%\System32\netsh.exe interface ip add dns "Ethernet"  1.0.0.3 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Ethernet" static 2a0d:2a00:1:: primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add  dns "Ethernet"  2606:4700:4700::1003 index=2        
   ECHO "Win7 Wifi"
    %SystemRoot%\System32\netsh.exe interface ip set dns "Wi-Fi" static 1.1.1.3 primary
    %SystemRoot%\System32\netsh.exe interface ip add  dns "Wi-Fi"  1.0.0.3 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add  dns "Wi-Fi"  2606:4700:4700::1003 index=2
    %SystemRoot%\System32\ipconfig.exe /flushdns
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO "Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS

GOTO END


GOTO START
:GoogleDNS_Win10
   ECHO "Changing Search Engine Results to GoogleDNS_Win10."
    ECHO  " Changing DNS Of This PC-Only Wifi To GoogleDNS_Win10..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Wi-Fi" static 8.8.8.8 primary 
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Wi-Fi" 8.8.4.4 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Wifi GoogleDNS_Win10g ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Wi-Fi" static 2001:4860:4860::8888 primary 
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Wi-Fi" 2a0d:2a00:2:: index=2 
    ECHO  ".............Changing IPV4 DNS Of This PC-Only Ethernet GoogleDNS_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Ethernet" static 8.8.8.8 primary 
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Ethernet" 8.8.4.4 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Ethernet GoogleDNS_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Wi-Fi" static 2001:4860:4860::8888 primary 
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Wi-Fi" 2a0d:2a00:2:: index=2 
    ECHO  ".............Changing IPV4 DNS Of This PC-Only Local Area Connection GoogleDNS_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv4 set dnsservers "Local Area Connection" static 8.8.8.8 primary  
    %SystemRoot%\System32\netsh.exe interface ipv4 add dnsservers "Local Area Connection" 8.8.4.4 index=2
    ECHO  ".............Changing IPV6 DNS Of This PC-Only Local Area Connection GoogleDNS_Win10 ..............................................................................." 
    %SystemRoot%\System32\netsh.exe interface ipv6 set dnsservers "Local Area Connection" static 2001:4860:4860::8888 primary 
    %SystemRoot%\System32\netsh.exe interface ipv6 add dnsservers "Local Area Connection" 2a0d:2a00:2:: index=2 
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "...................Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "....................Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO ".......................Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS    
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO "Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS

GOTO END

GOTO START
:GoogleDNS_Win_7
   ECHO "Windows 7 Ethernet"
    %SystemRoot%\System32\netsh.exe interface ip set dns "Ethernet" static 8.8.8.8 primary
    %SystemRoot%\System32\netsh.exe interface ip add dns "Ethernet" 8.8.4.4 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Ethernet" static 2001:4860:4860::8888 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add  dns "Ethernet" 2001:4860:4860::8844 index=2        
   ECHO "Win7 Wifi"
    %SystemRoot%\System32\netsh.exe interface ip set dns "Wi-Fi" static 8.8.8.8 primary
    %SystemRoot%\System32\netsh.exe interface ip add  dns "Wi-Fi"  8.8.4.4 index=2
    %SystemRoot%\System32\netsh.exe interface ipv6 set dns "Wi-Fi" static 2001:4860:4860::8888 primary
    %SystemRoot%\System32\netsh.exe interface ipv6 add  dns "Wi-Fi" 2001:4860:4860::8844 index=2        
    %SystemRoot%\System32\ipconfig.exe /flushdns
    ECHO "Flushing DNS..............." 
    %SystemRoot%\System32\ipconfig.exe /release 
    ECHO "Releasing DNS................." 
    %SystemRoot%\System32\ipconfig.exe /renew 
    ECHO "Renewing DNS............." 
    %SystemRoot%\System32\ipconfig.exe /all
    ECHO "Restarted Network Adapters and CHECK DNS Servers" 
    PAUSE
    PROMPT
    CLS
GOTO END

GOTO START
:Check_DNS_Servers 
IPCONFIG /ALL
ECHO "CHECKOUT THE NEW DNS SERVERS DNS Servers" 
PAUSE
GOTO END
