FROM ubuntu:24.04

WORKDIR /app

RUN apt update

# Install build dependencies and Python packages
RUN apt install libcairo2-dev libjpeg-dev libgif-dev libgirepository1.0-dev pkg-config cmake -y
RUN apt install python3 python3-pip python3-tk -y
RUN apt install python3-gi gir1.2-gtk-3.0 gir1.2-appindicator3-0.1 -y

# Install git
RUN apt install git -y

# Install GUI components
RUN apt install x11vnc xvfb icewm -y

RUN git -C TwitchDropsMiner pull || git clone https://github.com/DevilXD/TwitchDropsMiner.git
#COPY ./TwitchDropsMiner/ .
RUN pip3 install -r TwitchDropsMiner/requirements.txt --break-system-packages

#COPY ./docker-init.sh .
#CMD ["/bin/bash", "docker-init.sh"]
