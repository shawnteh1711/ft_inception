#!/bin/sh

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /var/www/html

    # back up vsftpd.conf
    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak

    # move edited conf file to original location
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

    # add a new user
    adduser $FTP_USER --disabled-password

    # set password for new user
    echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null

    # change ownership of /var/www/html
    chown -R $FTP_USER:$FTP_USER /var/www/html

    # add new user specidied in variable ro user list
    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null
fi

echo "FTP started on port 21."

# start vsftpd service using vsftpd.conf
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
