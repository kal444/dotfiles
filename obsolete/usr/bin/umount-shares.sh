#!/bin/sh

ping -q -c1 peng >/dev/null

if [ "$?" -eq "0" ]; then
    #smbmount //peng/public $HOME/smb/public -o credentials=$HOME/dev/etc/peng.cred
    umount.cifs $HOME/smb/kal
fi
