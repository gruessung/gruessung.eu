FROM ubuntu:latest AS ubuntu-with-updates
RUN apt update 
RUN apt upgrade -y

FROM ubuntu-with-updates as ubuntu-hugo
RUN apt install -y hugo
RUN mkdir /input

FROM ubuntu-hugo AS hugo-gruessung
COPY * /input/
WORKDIR /input
RUN ls
RUN hugo

