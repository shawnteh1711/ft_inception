FROM alpine:3.13

RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd ncftp

COPY ./conf/vsftpd.conf /tmp/vsftpd.conf

COPY ./tools/ftp.sh /tmp/ftp.sh

EXPOSE 21

ENTRYPOINT ["sh", "/tmp/ftp.sh"]
