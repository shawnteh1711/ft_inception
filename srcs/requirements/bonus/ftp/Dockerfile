FROM debian:buster

RUN apt-get update && \
        apt-get install -yqq vsftpd filezilla && \
            rm -rf /var/lib/apt/list/*

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/ftp.sh /tmp/ftp.sh

#expose 20 and 21 port default ftp
EXPOSE 20
EXPOSE 21

ENTRYPOINT ["sh", "/tmp/ftp.sh"]