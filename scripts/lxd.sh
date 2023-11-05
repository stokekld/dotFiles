#!/bin/sh
## Add settings for use windows in defualt profile
## lxc profile device add default waylandsock proxy listen=unix:/etc/wayland-0 connect=unix:/run/user/1000/wayland-0 bind=container uid=1000 gid=1000 security.gid=1000 security.uid=1000 mode=0777
## lxc profile device add default xsock proxy listen=unix:/etc/X0 connect=unix:/tmp/.X11-unix/X1 bind=container uid=1000 gid=1000 security.gid=1000 security.uid=1000 mode=0777
## 
## Create container and environment variables for script
## lxc launch images:ubuntu/focal robox-focal
## lxc exec robox-focal bash
## export NEW_USER=jesus
## export NEW_USER_PWD=stokekld

apt install git sudo openssh-server -y
useradd -m -s /usr/bin/bash $NEW_USER
echo "$NEW_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$NEW_USER
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | passwd $NEW_USER
$NEW_USER_PWD
$NEW_USER_PWD
EOF
ln -s /etc/wayland-0 /run/user/$(id -u $NEW_USER)/wayland-0
mkdir /tmp/.X11-unix
ln -s /etc/X0 /tmp/.X11-unix/X0
echo "export XDG_RUNTIME_DIR=/run/user/1000" >> /home/$NEW_USER/.profile
echo "export WAYLAND_DISPLAY=wayland-0" >> /home/$NEW_USER/.profile
echo "export QT_QPA_PLATFORM=wayland" >> /home/$NEW_USER/.profile
echo "export DISPLAY=:0" >> /home/$NEW_USER/.profile
