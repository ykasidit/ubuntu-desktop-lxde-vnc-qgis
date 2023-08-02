FROM ykasidit/ubuntu-desktop-lxde-vnc-qgis:latest

COPY azenqos-qgis-plugin/Azenqos/requirements.txt /requirements.txt
RUN apt-get -y install xvfb
RUN pip install -r /requirements.txt
RUN pip install Pillow==9.0.1