# docker-tdm
A docker image that runs [TwitchDropsMiner](https://github.com/DevilXD/TwitchDropsMiner) in a container with a VNC server.
This allows the application to be deployed in a headless environment while
still being configured through the GUI on a remote device by using a VNC viewer.

## Usage
Clone:
`git clone https://github.com/SimonAkers/docker-tdm.git`

Build:
`docker compose build`

Start:
`docker compose up -d`

Stop:
`docker compose down`

## Environment Variables
These variables are used in the container's build and run processes, located in the `.env` file.
- `VNCPASS` *(run)* - The password for the VNC server.
    - **Default:** `letmein`
- `TDM_REPO` *(build, run)* - The miner repository to use.
    - **Default:** `https://github.com/DevilXD/TwitchDropsMiner`
    - This is helpful if a forked version of the miner has implemented a critical patch before the main version.
    - It is recommended to use the main repository if possible, as forks are not guaranteed to work without modification to the image settings.
    - You must delete the existing repository and/or image for a new one to be cloned. It is recommend to build and deploy from scratch if changing repo.

## Components
`Ubuntu 22.04`
`python3`
`pip3`
`x11vnc`
`xvfb`
`git`
`TwitchDropsMiner`

## Notes
- The VNC server should be compatible with any standard VNC viewer. I used [TightVNC](https://www.tightvnc.com/) while making this.

- This container is NOT intended to have its ports exposed to the Internet.
It was not designed using rigorous security practices and I am using a plain-text password for the VNC server.
USE AT YOUR OWN RISK!

- **ALL ISSUES SHOULD BE REPORTED HERE FIRST.** Docker usage is not supported by the TDM maintainers, so any issues when using this container should go
through this repository first. If it turns out to be an issue with TDM itself, then we can proceed to move the issue to that repository.

## Known Issues
- After connecting to the VNC server, clicking the "Minimize to Tray" button causes the window to entirely disappear, even if you were to use a window manager and system tray. Restarting the container should restore the window. I have not yet found a way around this.
