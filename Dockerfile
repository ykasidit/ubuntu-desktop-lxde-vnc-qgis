FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

RUN add-apt-repository ppa:ubuntugis
RUN apt-get update
RUN apt-get -y install unzip qgis