# FROM debian:buster

# RUN apt-get update && \
#         apt-get install -yqq vsftpd filezilla && \
#             rm -rf /var/lib/apt/list/*

# COPY conf/vsftpd.conf /tmp/vsftpd.conf

# COPY tools/ftp.sh /tmp/ftp.sh

# #expose 20 and 21 port default ftp
# EXPOSE 20
# EXPOSE 21

# ENTRYPOINT ["sh", "/tmp/ftp.sh"]

FROM alpine:3.13

RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/ftp.sh /tmp/ftp.sh

EXPOSE 21

ENTRYPOINT ["sh", "/tmp/ftp.sh"]

# FROM alpine:3.16

# RUN apk update && apk upgrade && \
#     apk add --no-cache vsftpd

# RUN adduser -h /var/www -s /bin/false -D ${FTP_USR} && \
#     echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd && \
#     adduser ${FTP_USR} root

# RUN sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf && \
#     sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
#     sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
#     sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf

# RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
#     echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
#     echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf

# WORKDIR /var/www

# EXPOSE 21

# CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]