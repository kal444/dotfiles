# set a more permissive umask for normal users with primary group of the same name
if [ "`id -gn`" = "`id -un`" -a `id -u` -gt 99 ]; then
  # Files will be created with these permissions:
  # files 664 -rw-rw-r-- (666 minus 002)
  # dirs  775 drwxrwxr-x (777 minus 002)
  umask 002
else
  # Files will be created with these permissions:
  # files 644 -rw-r--r-- (666 minus 022)
  # dirs  755 drwxr-xr-x (777 minus 022)
  umask 022
fi
