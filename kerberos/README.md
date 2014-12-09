echo "192.168.122.1	mykdc.mydomain.com myserver.mydomain.com myserver" >> /etc/hosts

docker build -t kerberos .

docker run --net=host -i -t -d kerberos

docker attach <CONTAINER_ID>

[root@localhost /]# kdb5_util create -s
Enter KDC database master key: 
Re-enter KDC database master key to verify: 

[root@localhost /]# kadmin.local 
..
kadmin.local:  addprinc root/admin
..
Enter password for principal "root/admin@MYDOMAIN.COM": 
Re-enter password for principal "root/admin@MYDOMAIN.COM": 
..
kadmin.local:  exit

[root@localhost /]# service kadmin start
[root@localhost /]# service krb5kdc start
[root@localhost /]# service sshd start


[root@localhost /]# klist -e -k /etc/krb5.keytab 
Keytab name: FILE:/etc/krb5.keytab
klist: No such file or directory while starting keytab scan

Client 
---
$ kadmin -p root/admin
kadmin: addprinc <YOUR_USERNAME>
kadmin: addprinc -randkey host/myserver.mydomain.com
kadmin: exit

Host
---
# kadmin -p root/admin
kadmin: ktadd host/myserver.mydomain.com
kadmin: exit


Refer to: http://masahir0y.blogspot.jp/2012/12/kerberos-v5.html
