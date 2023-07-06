#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ "$1" == "-t" ]
then
        if [ "$2" == "A" ] || [ "$2" == "CNAME" ] || [ "$2" == "MX" ]
        then
                echo "type is correct"
        else
                echo "type is not correct"
                exit 1
        fi
fi

if ["$1"=="-t"]; then
	if["$2"=="A"]; then
		echo "$3.\tIN\tA\t$4" >> /etc/bind/db.${5%%.*}.be
	fi
	if["$2"=="CNAME"];then
		echo "$3.\tIN\tCNAME\t$4" >> /etc/bind/db.${5%%.*}.be
	fi
	if["$2"=="MX"];then
		echo "$3.\tIN\tA\t$4" >> /etc/bind/db.${5%%.*}.be
                echo "$3.\tIN\tMX\t$4.brick-vanroekel.sb.uclllabs.be" >> /etc/bind/db.${5%%.*}.be
	fi
else
	echo "$1.\tIN\tA\t$2" >> /etc/bind/db.${3%%.*}.be
fi

rndc reload
