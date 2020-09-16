ECHO ON


ECHO "BIW Is a script Available for Windows & Linux Designed to Block Possible Ways of you computer to connect to Adult-Content Based Websites"




ECHO "Warning incase of any network Errors Please Copy Your original hosts File at Desktop"
ECHO " It will be at OriginalFile "
ECHO " & then COPY hosts to C:\Windows\System32\drivers\etc"
ECHO " Enjoy your distraction-free Computer"




ECHO "Copying the original Windows Hosts file" 

CD c:\Users\Public\Desktop
MKDIR OriginalFile
CD
CD C:\Windows\System32\drivers\etc
COPY hosts c:\Users\Public\Desktop\OriginalFile
DEL hosts
CD 
CD C:\Users\Administrator\Desktop\Block Illegal Websites\etc
COPY hosts C:\Windows\System32\drivers\etc
ipconfig /flushdns





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

	



#Windows 7

#ECHO "Windows 7"

#Win7 Wifi

#netsh interface ip set dns "Wi-Fi" static 185.228.168.168
#netsh interface ipv6 set dns "Wi-Fi" static 2a0d:2a00:1::
	

# Win7 Ethernet

#netsh interface ip set dns "Ethernet" static 185.228.168.168
#netsh interface ipv6 set dns "Ethernet" static 2a0d:2a00:1::	
	

