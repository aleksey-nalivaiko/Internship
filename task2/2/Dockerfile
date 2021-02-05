# Dockefile to build Docker image of Apache WebServer running on Ubuntu

FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install apache2

RUN echo 'Aleksey Nalivaiko Exadel Sandbox 2021' > /var/www/html/index.html

# Run Apache WebServer 
CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80
