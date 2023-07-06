#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Script must be run as root" 1>&2
   exit 1
fi


#named.conf.mrt-zones
echo "zone \"$1\" {
        type master;
        file \"/etc/bind/db.$1.brick-vanroekel.sb.uclllabs.be\";
};" >> /etc/bind/named.conf.mrt-zones

mkdir -p /etc/bind/zones
touch /etc/bind/zones/db.$1.brick-vanroekel.sb.uclllabs.be

echo "\$TTL 900
@       IN      SOA     brick-vanroekel.sb.uclllabs.be. r0795577.sb.uclllabs.be. (
                        1      ; Serial
               		900    ; Refresh
                        900    ; Retry
                        900    ; Expire
                        900 )  ; Negative Cache TTL
;
@	IN	NS	ns.brick-vanroekel.sb.uclllabs.be.
ns	IN	A	193.191.177.138
" > /etc/bind/zones/db.$1.brick-vanroekel.sb.uclllabs.be

echo "$1	IN	NS	ns.brick-vanroekel.sb.uclllabs.be." >> /etc/bind/db.brick-vanroekel.sb.uclllabs.be

perl -i -pe '/Serial/ && s/(\d+)/$1+1/e' "/etc/bind/db.brick-vanroekel.sb.uclllabs.be"

rndc reload

