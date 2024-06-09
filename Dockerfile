FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt update

RUN apt install python3-full python3-pip -y
RUN apt install pkg-config cmake -y
RUN apt install libcairo2-dev -y
RUN apt install libgirepository1.0-dev -y
RUN apt install python3-gi -y
RUN apt install gir1.2-gtk-3.0 -y
RUN apt install gir1.2-appindicator3-0.1 -y
RUN apt install git -y
RUN apt install x11vnc xvfb -y

RUN git -C TwitchDropsMiner pull || git clone https://github.com/DevilXD/TwitchDropsMiner.git

# for debug purposes
RUN pip3 list

RUN pip3 install -r TwitchDropsMiner/requirements.txt
