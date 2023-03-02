FROM alpine:3.16

ARG PHP_VERSION=8

# php${PHP_VERSION}-common: This package contains common files that are shared across multiple PHP modules.
# php${PHP_VERSION}-session: This package enables PHP to handle sessions, which are used to store data across multiple requests.
# php${PHP_VERSION}-iconv: This package provides a set of functions for converting character encodings.
# php${PHP_VERSION}-gd: This package enables PHP to work with image files.
# php${PHP_VERSION}-curl: This package enables PHP to work with cURL, which is used to make HTTP requests.
# php${PHP_VERSION}-xml: This package enables PHP to work with XML files.
# php${PHP_VERSION}-mysqli: This package provides a MySQL driver for PHP.
# php${PHP_VERSION}-imap: This package provides an IMAP driver for PHP, which is used to work with email.
# php${PHP_VERSION}-cgi: This package provides the PHP CGI executable.
# php${PHP_VERSION}-pdo: This package provides a database abstraction layer for PHP.
# php${PHP_VERSION}-pdo_mysql: This package provides a MySQL driver for PHP's PDO module.
# php${PHP_VERSION}-soap: This package provides a SOAP client and server for PHP.
# php${PHP_VERSION}-posix: This package provides POSIX functions for PHP.
# php${PHP_VERSION}-gettext: This package provides internationalization functions for PHP.
# php${PHP_VERSION}-ldap: This package provides an LDAP driver for PHP.
# php${PHP_VERSION}-ctype: This package provides ctype functions for PHP.
# php${PHP_VERSION}-dom: This package provides a DOM extension for PHP, which is used to manipulate XML documents.
# php${PHP_VERSION}-simplexml: This package provides a SimpleXML extension for PHP, which is used to parse and manipulate XML documents.
# wget: This package is a command-line tool for downloading files from the web. It is included here so that the Docker container can download the Adminer application.

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \ 
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-session \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-imap \
    php${PHP_VERSION}-cgi \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-pdo_mysql \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-posix \
    php${PHP_VERSION}-gettext \
    php${PHP_VERSION}-ldap \
    php${PHP_VERSION}-ctype \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-simplexml \
    wget

WORKDIR /var/www

# Install adminer and rename adminer-4.8.1.php to index,php and change file ownership
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
        mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 9020

# Start the PHP built-in web server and serve web content from root directory /var/www
CMD ["php", "-S", "[::]:9020", "-t", "/var/www"]