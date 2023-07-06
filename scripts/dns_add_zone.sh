#!/bin/bash

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


