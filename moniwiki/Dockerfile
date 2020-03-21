FROM ubuntu:14.04

RUN apt-get update &&\
  apt-get -qq -y install git curl build-essential apache2 php5 libapache2-mod-php5 rcs

WORKDIR /tmp
RUN \
  curl -L -O https://github.com/wkpark/moniwiki/archive/v1.2.5p1.tar.gz &&\
  tar xf /tmp/v1.2.5p1.tar.gz &&\
  mv moniwiki-1.2.5p1 /var/www/html/moniwiki &&\
  chown -R www-data:www-data /var/www/html/moniwiki &&\
  chmod 777 /var/www/html/moniwiki/data/ /var/www/html/moniwiki/ &&\
  chmod +x /var/www/html/moniwiki/secure.sh &&\
  /var/www/html/moniwiki/secure.sh

RUN a2enmod rewrite

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
CMD bash -c "source /etc/apache2/envvars && /usr/sbin/apache2 -D FOREGROUND"
