FROM dorowu/ubuntu-desktop-lxde-vnc:focal

RUN add-apt-repository ppa:ubuntugis
RUN apt-get update
RUN apt-get -y install unzip qgis
RUN apt-get -y install python3-pip
RUN useradd admin -m
COPY firefox.desktop /home/admin/Desktop/
COPY org.qgis.qgis.desktop /home/admin/Desktop/
ADD azenqos-qgis-plugin /home/admin/azenqos-qgis-plugin
RUN echo 'admin ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER admin
WORKDIR /home/admin/azenqos-qgis-plugin
RUN ./install_azenqos_plugin_ubuntu.sh