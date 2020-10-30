#!/bin/bash

if [ ${#@} -eq 0 ] ; then
    	echo "error: You should have at least one argument" >&2; exit 1
fi

#Penser à commenter les scripts
for i in ${@}
do
    	re='^[0-9]+$'
    	if ! [[ $i =~ $re ]] ; then
            	echo "error: '$i' is not a number" >&2; exit 1
    	fi
done


iptables -t filter -F



for i in ${@}
do
    	iptables -t filter -A INPUT  -p TCP -i eth0 --dport $i -j ACCEPT
    	iptables -t filter -A OUTPUT -p TCP -o eth0 --sport $i -j ACCEPT
done
iptables -P INPUT DROP
