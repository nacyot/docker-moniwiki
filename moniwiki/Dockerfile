FROM ubuntu:14.04
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

# Install basic packages
RUN \
  apt-get update &&\
  apt-get -qq -y install curl rcs

# Install php5 and apache2
RUN \
  apt-get -qq -y install apache2 php5 libapache2-mod-php5 &&\
  a2enmod rewrite 

# Install Moniwiki
WORKDIR /tmp
RUN \
  curl -L -O http://dev.naver.com/frs/download.php/8193/moniwiki-1.2.1.tgz &&\
  tar xf /tmp/moniwiki-1.2.1.tgz &&\
  mv moniwiki /var/www/html/ &&\
  chown -R www-data:www-data /var/www/html/moniwiki &&\
  chmod 777 /var/www/html/moniwiki/data/ /var/www/html/moniwiki/ &&\
  chmod +x /var/www/html/moniwiki/secure.sh &&\
  /var/www/html/moniwiki/secure.sh

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
CMD bash -c "source /etc/apache2/envvars && /usr/sbin/apache2 -D FOREGROUND"
