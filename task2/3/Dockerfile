# Dockefile to build Docker image of Apache WebServer running on Ubuntu

FROM ubuntu:16.04

ENV DEVOPS="Aleksey"

RUN apt-get -y update \
    && apt-get -y install apache2 \
    && echo ' $DEVOPS Exadel Sandbox 2021' > /var/www/html/index.html

# Run Apache WebServer
CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80
