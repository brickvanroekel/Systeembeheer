; BIND reverse data file for empty rfc1918 zone
;
; DO NOT EDIT THIS FILE - it is used for multiple zones.
; Instead, copy it, edit named.conf, and use that copy.
;
$TTL	86400
$ORIGIN brick-vanroekel.sb.uclllabs.be.
@	IN	SOA	brick-vanroekel.sb.uclllabs.be. root.brick-vanroekel.sb.uclllabs.be. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			  86400 )	; Negative Cache TTL
;name servers
@	IN	NS	ns.brick-vanroekel.sb.uclllabs.be.
ns	IN	AAAA	fe80::7ce5:3aff:fed1:844a
@	IN	AAAA	fe80::7ce5:3aff:fed1:844a
@	IN	NS	ns1.uclllabs.be
@	IN	NS	ns2.uclllabs.be
@	IN	NS	ns.boris-michiels.sb.uclllabs.be.

;A records
@	IN	A	193.191.177.138
ns      IN      A       193.191.177.138
www	IN	A	193.191.177.138
www1    IN      A       193.191.177.138
www2    IN      A       193.191.177.138
mail	IN	A	193.191.177.138
ns      IN      A       193.191.177.138
ns1     IN      A       193.191.176.254
ns2     IN      A       193.191.177.4
test	IN	A	193.191.177.254
