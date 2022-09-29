FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i -e "s|archive.ubuntu.com|mirrors.hit.edu.cn|g" -e "s|security.ubuntu.com|mirrors.hit.edu.cn|g" /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y apache2 zip unzip apache2 libapache2-mod-xsendfile libapache2-mod-php php php-dev php-pear php-zip php-mysql php-mbstring

COPY /docker-entrypoint.sh /
COPY src /usr/src/uoj
VOLUME ["/var/www/html"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

