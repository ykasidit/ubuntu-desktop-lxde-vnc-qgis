FROM ykasidit/ubuntu-desktop-lxde-vnc-qgis:latest

COPY azenqos-qgis-plugin/Azenqos/requirements.txt /requirements.txt
RUN apt-get -y install xvfb
RUN pip install -r /requirements.txt
RUN pip install Pillow==9.0.1
RUN apt -y install openssh-server

RUN mkdir /home/admin/.ssh
RUN chown admin /home/admin/.ssh
EXPOSE 22
ENTRYPOINT ["bash", "-c","service ssh start && /startup.sh"]