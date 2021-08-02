FROM ubuntu

WORKDIR app

COPY . /app/

RUN apt update -y

RUN apt install -y wget unzip

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y tzdata

ARG DEBIAN_FRONTEND=interactive

RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN dpkg -i google-chrome-stable_current_amd64.deb

RUN apt -f install -y

RUN ./script/install_chromedriver_linux.sh

RUN echo "" > /dev/null
