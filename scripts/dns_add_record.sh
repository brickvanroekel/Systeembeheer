#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if ["$1"=="-t"]; then
	if["$2"=="A"]; then
	fi
	if["$2"=="CNAME"];then
	fi
	if["$2"=="MX"];then
	fi
else

fi
