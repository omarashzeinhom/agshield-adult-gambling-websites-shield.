#!/bin/bash 
@ECHO OFF
CLS 

TITLE = Block Adult and Gambling Windows by andgoedu



ECHO 1. Changing hosts file
ECHO 2. Changing DNS Servers (CloudFlare Family) Win 10
ECHO 3. Changing DNS Servers (CloudFlare Family Shield) Win 7
ECHO 4. Check DNS Servers 



CHOICE /C 1234 /M "Enter your choice:"



:: Note - list ERRRORLEVELS in decreasing order
IF ERRORLEVEL 4 GOTO Check DNS Servers 
IF ERRORLEVEL 3 GOTO Changing DNS Servers Cleanbrowsing Family Windows 7
IF ERRORLEVEL 2 GOTO Changing DNS Servers Cleanbrowsing  Family Windows 10
IF ERRORLEVEL 1 GOTO Changing hosts file 


:Changing hosts file 
    ECHO "Copying the original Windows Hosts file "
    PAUSE
    CD C:\Users\Public\Documents
    MKDIR OriginalFile
    CD
    CD C:\Windows\System32\drivers\etc
    XCOPY hosts C:\Users\Public\Documents\OriginalFile
    ECHO "Your original hosts was copied To C:\Users\Public\Documents\OriginalFile" 
    PAUSE
    ECHO "Deleting Old hosts file .............................................................." 
    DEL C:\Windows\System32\drivers\etc\hosts 
    ECHO "Deleting Old hosts file .............................................................." 
    XCOPY \hosts C:\Windows\System32\drivers\etc
    ECHO "Your Hosts File Was Changed SuccessFully" 
    PAUSE
    CLS
;


:Changing DNS Servers Cleanbrowsing  Family Windows 10
    ECHO "Changing Search Engine Results to Safe Family (CloudFlare Family DNS)."
    ECHO  " Changing DNS Of This PC-Only Wifi..............................................................................." 
    netsh interface ipv4 set dns "Wi-Fi" static 185.228.168.168 primary
    netsh interface ipv4 add dns "Wi-Fi" 185.228.169.168 index=2
    netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
    netsh interface ipv6 add dns "Wi-Fi" 2a0d:2a00:2:: index=2

    ECHO  " Changing DNS Of This PC-Only Ethernet ..............................................................."
    netsh interface ipv4 set dns "Ethernet" static 185.228.168.168 primary
    netsh interface ipv4 add dns "Ethernet" 185.228.169.168 index=2
    netsh interface ipv6 set dns "Ethernet" static 2a0d:2a00:1:: primary
    netsh interface ipv6 add dns "Ethernet" 2a0d:2a00:2:: index=2


    netsh interface ipv4 set dns "Local Area Connection" static 185.228.168.168 primary
    netsh interface ipv4 add dns "Local Area Connection" 185.228.169.168 index=2
    netsh interface ipv6 set dns "Local Area Connection" static 2a0d:2a00:1:: primary
    netsh interface ipv6 add dns "Local Area Connection" 2a0d:2a00:2:: index=2

    ECHO " Changing DNS Of This PC-Only Local Area Connection.............................................."

    
    ipconfig /flushdns
    ipconfig /release 
    ipconfig /renew 
    ECHO "Restarted Network Adapters" 
    ECHO "Add Cleanbrowsing family DNS To Windows 7 ?"
    PAUSE
    PROMPT
    CLS
;

:Changing DNS Servers Cleanbrowsing Family Windows 7
   ECHO "Windows 7 Ethernet"
   netsh interface ip set dns "Wi-Fi" static 1.1.1.3  primary
   netsh interface ip add dns "Ethernet" static 1.0.0.3 index=2
   netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
   netsh interface ipv6 add  dns "Wi-Fi" 2606:4700:4700::1003 index=2        

   ECHO "Win7 Wifi"
   netsh interface ip set dns "Wi-Fi" static 1.1.1.3 primary
   netsh interface ip add  dns "Wi-Fi" static 1.0.0.3 index=2
   netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1:: primary
   netsh interface ipv6 add  dns "Wi-Fi" 2606:4700:4700::1003 index=2
   ipconfig /flushdns
   ipconfig /release 
   ipconfig /renew 
   ECHO "Restarted Network Adapters" 
   ECHO "Check DNS Servers ?"
   PROMPT
   PAUSE
   CLS
;


:Check DNS Servers 
    IPCONFIG /ALL
    PAUSE
    PROMPT
    ECHO "CHECKOUT THE NEW DNS SERVERS 
    DNS Servers . . . . . . . . . . . : 185.228.168.168
                                       185.228.169.168" 
    ;

GOTO END;
