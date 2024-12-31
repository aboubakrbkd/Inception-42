#!/bin/bash

if ! id "$FTP_USER" &>/dev/null; then
    adduser --disabled-password --gecos "" $FTP_USER
    echo "$FTP_USER:$FTP_PASSWORD_USER" | chpasswd
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
else
    echo "User $FTP_USER already exists."
fi

mkdir -p /home/$FTP_USER/ftp/files
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

sed -i -r "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf

echo "local_enable=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf
echo "pasv_min_port=10000" >> /etc/vsftpd.conf
echo "pasv_max_port=10100" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

exec /usr/sbin/vsftpd
