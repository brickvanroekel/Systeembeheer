#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Script must be run as root" 1>&2
   exit 1
fi


#named.conf.mrt-zones
echo "zone \"$1\" {
        type master;
        file \"/etc/bind/db.$1\.be";
};" >> /etc/bind/named.conf.mrt-zones

#named.conf.local
echo "zone \"$1\" {
        type master;
        file \"/etc/bind/db.$1\.be";
};" >> /etc/bind/named.conf.local


echo "\$TTL 900
\$ORIGIN brick-vanroekel.sb.uclllabs.be.
@       IN      SOA     brick-vanroekel.sb.uclllabs.be. r0795577.sb.uclllabs.be. (
                        1      ; Serial
               		900    ; Refresh
                        900    ; Retry
                        900    ; Expire
                        900 )  ; Negative Cache TTL
;
" > /etc/bind/db.$1.be

rndc reload

