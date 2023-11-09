#!/bin/bash

url=$1

echo "[+] Scanning with Nmap..."

nmap -sn -R --open -oX scan_results.xml $url

echo "[+] Converting to HTML..."

xsltproc scan_results.xml -o results.html

echo "[+] Succes! Please check results.html"
	


# -sn: This option skips the port scan and only performs host discovery. 

# -R: This option enables reverse DNS resolution. 

# --open: This option reports only the hosts with at least one open port. It can help in focusing on potentially interesting hosts.

# -oX scan_results.xml: This option saves the results in XML format

# Replace url with the target IP address or range.



