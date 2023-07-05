; BIND reverse data file for empty rfc1918 zone
;
; DO NOT EDIT THIS FILE - it is used for multiple zones.
; Instead, copy it, edit named.conf, and use that copy.
;
$TTL	604800
@	IN	SOA	ns.brick-vanroekel.sb.uclllabs.be. r0795577.ucll.be. (
			    102		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.brick-vanroekel.sb.uclllabs.be.
ns      IN      A       193.191.177.138

@	IN	NS	ns1.uclllabs.be
@	IN	NS	ns2.uclllabs.be
@	IN	NS	boris-michiels.sb.uclllabs.be.

www	IN	A	193.191.177.138
test	IN	A	193.191.177.254