FROM ubuntu:latest AS ubuntu-with-updates
RUN apt update 
RUN apt upgrade -y

FROM ubuntu-with-updates as ubuntu-hugo
RUN apt install -y hugo
RUN mkdir /git
RUN mkdir /html

FROM ubuntu-hugo AS hugo-gruessung
WORKDIR /git
RUN git clone https://github.com/gruessung/gruessung.eu.git .
RUN hugo

COPY . /html




#CMD ["git", "clone", "https://github.com/gruessung/gruessung.eu.git", "."]
CMD ["/bin/bash"]

