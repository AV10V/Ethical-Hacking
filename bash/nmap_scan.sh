#!/bin/bash

#usage sh nmap.sh <target>

taget=$1

echo "[+] Scanning with Nmap..."

nmap -sn -R --open -oX scan_results.xml $target


# -sn: This option skips the port scan and only performs host discovery. 

# -R: This option enables reverse DNS resolution. 

# --open: This option reports only the hosts with at least one open port. It can help in focusing on potentially interesting hosts.

# -oX scan_results.xml: This option saves the results in XML format

# Replace url with the target IP address or range.



