#!/bin/bash 
@ECHO OFF
CLS 
ECHO 1. Changing hosts file
ECHO 2. Changing DNS Servers (CloudFlare Family) Win10
ECHO 3. Changing DNS Servers (Family Sheild) Win 7



CHOICE /C 123 /M "Enter your choice:"



:: Note - list ERRRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO Changing DNS Servers (CloudFlare) Windows 7
IF ERRORLEVEL 2 GOTO Changing DNS Servers (CloudFlare Family) Win10
IF ERRORLEVEL 1 GOTO Changing hosts file 


:Changing hosts file 
ECHO "Copying the original Windows Hosts file "
CD C:\Users\Public\Documents
MKDIR OriginalFile
CD
CD C:\Windows\System32\drivers\etc
COPY hosts C:\Users\Public\Documents\OriginalFile
ECHO "Your original file was copied C:\Users\Public\Documents\OriginalFile " 
DEL C:\Windows\System32\drivers\etc\hosts

COPY \hosts C:\Windows\System32\drivers\etc
ipconfig /flushdns
ECHO "Your Hosts File Was Changed SuccessFully" 
GOTO END



:Changing Changing DNS Servers (CloudFlare Family) Win10
    ECHO "Changing Search Engine Results to Safe Family (CloudFlare Family DNS)."

    ECHO "Changing DNS Servers to Clean-DNS ..."


    ECHO  " Changing DNS Of This PC-Only Wifi....." 

    netsh interface ipv4 set dns "Wi-Fi" static 185.228.168.168 primary
    netsh interface ipv4 add dns "Wi-Fi" 185.228.169.168 index=2
    netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
    netsh interface ipv6 add dns "Wi-Fi" 2a0d:2a00:2:: index=2

    ECHO  " Changing DNS Of This PC-Only Ethernet ...."


    netsh interface ipv4 set dns "Ethernet" static 185.228.168.168 primary
    netsh interface ipv4 add dns "Ethernet" 185.228.169.168 index=2
    netsh interface ipv6 set dns "Ethernet" static 2a0d:2a00:1:: primary
    netsh interface ipv6 add dns "Ethernet" 2a0d:2a00:2:: index=2

    ECHO " Changing DNS Of This PC-Only Local Area Connection...."

    netsh interface ipv4 set dns "Local Area Connection" static 185.228.168.168 primary
    netsh interface ipv4 add dns "Local Area Connection" 185.228.169.168 index=2
    netsh interface ipv6 set dns "Local Area Connection" static 2a0d:2a00:1:: primary
    netsh interface ipv6 add dns "Local Area Connection" 2a0d:2a00:2:: index=2



    ECHO " Changing DNS Of This PC-Only Local Area Connection...."


    netsh interface ipv4 set dns "Wi-Fi" static 185.228.168.168 primary
    netsh interface ipv4 add dns "Wi-Fi" 185.228.169.168 index=2
    netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
    netsh interface ipv6 add dns "Wi-Fi" 2a0d:2a00:2:: index=2

        
;;


:Changing DNS Servers (CloudFlare) Windows 7
   ECHO "Windows 7 Ethernet"
   netsh interface ip set dns "Wi-Fi" static 1.1.1.3  primary
   netsh interface ip set dns "Ethernet" static 1.0.0.3 index=2
   netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
   netsh interface ipv6 set dns "Wi-Fi" 2606:4700:4700::1003 index=2        

   ECHO "Win7 Wifi"
   netsh interface ip set dns "Wi-Fi" static 1.1.1.3 primary
   netsh interface ip set dns "Wi-Fi" static 1.0.0.3 index=2
   netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
   netsh interface ipv6 set dns "Wi-Fi" 2606:4700:4700::1003 index=2
      
;;
