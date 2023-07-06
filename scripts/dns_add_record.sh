#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

check_file () {
    FNAME=${1##*/}
    if [ $FNAME == "db.brick-vanroekel.sb.uclllabs.be" ]; then
	FILE=/etc/bind/$FNAME
    fi
}

if [ $1 != "-t" ]; then
	FILE=/etc/bind/zones/db.$3
	check_file $FILE
        echo "$1	IN	A	$2" >> $FILE
fi

while getopts t: o; do
    case "${o}" in
        t)
            TYPE=${OPTARG}
	    if [[ ! $TYPE =~ (A|MX|CNAME) ]]; then 
		{ echo "Wrong type"; exit 1; }
	    fi
            ;;
    esac
done

case $TYPE in
    A)
	FILE=/etc/bind/zones/db.$5
	check_file $FILE
	echo "$3	IN	A	$4" >> $FILE
	;;
    CNAME)
	FILE=/etc/bind/db.boris-michiels.sb.uclllabs.be
	echo "$3	IN	CNAME	$4" >> $FILE
	;;
    MX)
	FILE=/etc/bind/db.$5
	echo "@	IN	MX	10	$3.$5.
$3	IN	A	$4" >> $FILE
	;;
esac

perl -i -pe '/Serial/ && s/(\d+)/$1+1/e' "$FILE"

rndc reload
