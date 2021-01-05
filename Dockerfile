FROM ubuntu:latest AS ubuntu-with-updates

MAINTAINER gruessung

RUN apt update 
RUN apt upgrade -y

FROM ubuntu-with-updates as ubuntu-hugo
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends tzdata
RUN apt install -y hugo nginx
RUN mkdir /git
#RUN mkdir /var/www
#RUN mkdir /var/www/html

FROM ubuntu-hugo AS hugo-gruessung
WORKDIR /git
#RUN git clone https://github.com/gruessung/gruessung.eu.git .
COPY . .
RUN hugo

#WORKDIR /git/public
RUN mv /git/public/* /var/www/html/

#CMD ["git", "clone", "https://github.com/gruessung/gruessung.eu.git", "/git"]
EXPOSE 80
#CMD ["/bin/bash"]
CMD ["nginx","-g","daemon off;"]

