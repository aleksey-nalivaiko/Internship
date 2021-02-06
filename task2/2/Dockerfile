# Dockefile to build Docker image of Nginx running on Ubuntu
FROM ubuntu:20.04

ENV DEVOPS="Aleksey Nalivaiko"

RUN apt-get -y update \
    && apt-get install -y nginx \
    && echo ' $DEVOPS Exadel Sandbox 2021' > /var/www/html/index.nginx-debian.html
	
# Run nginx 
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80