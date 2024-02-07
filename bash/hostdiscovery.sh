#!/bin/bash

scan_and_convert() {
  subnet="$1"
  xml_file="${subnet//\//_}.xml"

  # Scan
  if [[ $yn == 'y' ]] 
  then
    nmap -sn -PE -PP -PS21,22,23,25,80,113,443,31339 -PA80,113,443,10042 --source-port 53 -R -vvv -oX "output/$xml_file" "$subnet" --dns-server "$dns"
  else
    nmap -sn -PE -PP -PS21,22,23,25,80,113,443,31339 -PA80,113,443,10042 --source-port 53 -vvv -oX "output/$xml_file" "$subnet"
  fi

  nmap-converter -o "output/$xml_file.xlsx" "output/$xml_file"
}

# Subnet in input
main() {
  read -p "Do you wish to perform a Reverse DNS Lookup? (y/N) " yn
  if [[ $yn == 'y' ]] 
  then
    read -p "Insert DNS server IP: " dns
  else
    echo "You choose to NOT perform a reverse lookup."
  fi

  read -p "Insert one or more subnets in CIDR notation, divided by commas (,): " subnets
  IFS=',' read -ra subnet_array <<< "$subnets"

  for subnet in "${subnet_array[@]}"; do
    scan_and_convert "$subnet"
  done
}

main
