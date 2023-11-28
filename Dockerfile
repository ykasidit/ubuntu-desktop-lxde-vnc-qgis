FROM dorowu/ubuntu-desktop-lxde-vnc:focal

RUN add-apt-repository ppa:ubuntugis
RUN apt-get update
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386
RUN apt-get -y install unzip qgis
RUN apt-get -y install python3-pip
RUN useradd admin -m
RUN echo 'admin ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
COPY requirements.txt /home/admin/requirements.txt
RUN pip install -r /home/admin/requirements.txt
RUN apt-get -y install crudini
RUN apt-get -y install language-pack-th language-pack-gnome-th language-pack-th-base language-pack-gnome-th-base
RUN locale-gen
RUN apt-get -y install msttcorefonts
RUN apt-get -y install --reinstall ttf-ubuntu-font-family
RUN apt -y install xfonts-thai
RUN wget ftp://ftp.psu.ac.th/pub/thaifonts/sipa-fonts/*ttf -P /usr/share/fonts/truetype/thai
RUN fc-cache -fv
RUN apt-get update
RUN apt-get -y install filezilla libreoffice
RUN apt -y install libsqlite3-mod-spatialite 
RUN apt-get -y install libproj15

USER admin
COPY firefox.desktop /home/admin/Desktop/
COPY org.qgis.qgis.desktop /home/admin/Desktop/
ADD --chown=admin azenqos-qgis-plugin /home/admin/azenqos-qgis-plugin
ADD --chown=admin profiles /home/admin/.local/share/QGIS/QGIS3/profiles
WORKDIR /home/admin/azenqos-qgis-plugin
RUN HOME=/home/admin ./install_azenqos_plugin_ubuntu.sh
USER root