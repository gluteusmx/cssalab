#!/bin/bash
#
for i in 16 17 18
do 
ssh root@student$i.local 'cat <<EOF>/etc/sddm.conf.d/autologin.conf
[Autologin]
User=student
Session=plasma
EOF
groupadd -r nopasswdlogin
groupadd -r autologin
gpasswd -a student nopasswdlogin
gpasswd -a student autologin
'
scp pam.d/* root@student$i.local:/etc/pam.d/
done
