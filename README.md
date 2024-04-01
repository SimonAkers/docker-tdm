# docker-tdm

A docker image that runs [TwitchDropsMiner](https://github.com/DevilXD/TwitchDropsMiner) in a container with a VNC server.
This allows the application to be deployed in a headless environment while
still being configured through the GUI on a remote device with a VNC viewer.

By default, the VNC server has the password set to `letmein`. You can change this in the `compose.yml` file.

At the moment, this container is NOT intended to have its ports exposed to the Internet.
It was not designed using rigorous security practices and I am using a plain-text password for the VNC server.
USE AT YOUR OWN RISK!
