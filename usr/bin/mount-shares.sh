#!/bin/sh

ping -q -c1 peng >/dev/null

if [ "$?" -eq "0" ]; then
    #smbmount //peng/public $HOME/smb/public -o credentials=$HOME/dev/etc/peng.cred
    mount.cifs //peng/users/kal $HOME/smb/kal -o credentials=$HOME/dev/etc/peng.cred,uid=kal,gid=kal,dir_mode=0700,file_mode=0600
fi
