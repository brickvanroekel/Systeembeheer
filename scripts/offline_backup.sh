ssh -p 22345 r0795577@leia.uclllabs.be 'mkdir -p /home/LDAP/r0795577/systeembeheer/backup/' && rsync -a --delete -e 'ssh -p 22345' /etc r0795577@leia.uclllabs.be:/home/LDAP/r0795577/systeembeheer/backup/

