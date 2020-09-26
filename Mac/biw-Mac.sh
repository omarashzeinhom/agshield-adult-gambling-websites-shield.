#!/bin/sh
echo "Copying Original files to dir ~/Library"

#Copying Original Network Files to ~/DNS-Files

mkdir Original-DNS-Files && cd /private/etc/
cp /hosts ~/Library && cp resolv.conf ~/Library 
rm /hosts && rm /resolv.conf


#Changing hosts file to block websites...

cd ~/Block-Illegal-Websites/etc
cp hosts /private/etc && cp resolv.conf /private/etc

echo "All Done Enjoy your filtered Computer"
