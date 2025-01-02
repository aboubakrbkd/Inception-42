#!/bin/bash

if [ ! -d "/var/run/vsftpd/empty" ]; then
    mkdir -p "/var/run/vsftpd/empty"
    chown root:root "/var/run/vsftpd/empty"
    chmod 555 "/var/run/vsftpd/empty"
fi

adduser --gecos "" --disabled-password $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD_USER" | chpasswd
mkdir -p /home/$FTP_USER/ftp
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

echo "Updating vsftpd configuration."
{
    echo "write_enable=YES"
    echo "chroot_local_user=YES"
    echo "local_enable=YES"
    echo "allow_writeable_chroot=YES"
    echo "pasv_enable=YES"
    echo "local_root=/home/$FTP_USER/ftp"
    echo "pasv_min_port=10000"
    echo "pasv_max_port=10100"
    echo "userlist_file=/etc/vsftpd.userlist"
    echo "$FTP_USER" >> /etc/vsftpd.userlist
    
} >> "/etc/vsftpd.conf"

exec /usr/sbin/vsftpd
