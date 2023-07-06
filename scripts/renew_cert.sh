#!/bin/bash
ExpirationDate=$(openssl x509 -in /etc/letsencrypt/live/brick-vanroekel.sb.uclllabs.be/cert.pem -text -noout | grep After | cut -d':' -f2-4)
Date=$(date -d "$ExpirationDate" "+%d-%m-%Y")
Today=$(date +%d-%m-%Y)

if [ $Date == $Today ]; then
        certbot renew
else
        echo Certification available untill: $Date
fi
