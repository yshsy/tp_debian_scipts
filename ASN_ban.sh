#!/bin/bash


whois -h whois.radb.net -i origin AS14061 | grep -w route | cut -c 14- > IPlist.txt


while read ip; do

    	iptables -t filter -A INPUT -s $ip -j DROP

done < IPlist.txt
