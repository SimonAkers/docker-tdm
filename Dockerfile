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
RUN apt install fluxbox -y
RUN apt install x11-xserver-utils -y
RUN apt install xdotool wmctrl -y

# meson requirements
RUN apt install python3-setuptools -y
RUN apt install python3-wheel -y
RUN apt install ninja-build -y

# Repo URL
ARG TDM_REPO
ENV TDM_REPO $TDM_REPO

RUN git -C TwitchDropsMiner pull || git clone $TDM_REPO TwitchDropsMiner

# For debug purposes
# RUN pip3 list

RUN pip3 install meson
RUN pip3 install -r TwitchDropsMiner/requirements.txt
ENTRYPOINT ["/init.sh"]
