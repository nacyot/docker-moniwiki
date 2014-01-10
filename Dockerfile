FROM ubuntu:12.04
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

# Run upgrades
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Install basic packages
RUN apt-get -qq -y install git curl build-essential

# Install apache2
RUN apt-get -qq -y install apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
RUN a2enmod rewrite 

# Install php
RUN apt-get -qq -y install php5
RUN apt-get -qq -y install libapache2-mod-php5

# Install Moniwiki
RUN apt-get install rcs
RUN cd /tmp; curl -L -O http://dev.naver.com/frs/download.php/8193/moniwiki-1.2.1.tgz
RUN tar xf /tmp/moniwiki-1.2.1.tgz
RUN mv moniwiki /var/www/
RUN chown -R www-data:www-data /var/www/moniwiki
RUN chmod 777 /var/www/moniwiki/data/ /var/www/moniwiki/
RUN chmod +x /var/www/moniwiki/secure.sh
RUN ./var/www/moniwiki/secure.sh

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
