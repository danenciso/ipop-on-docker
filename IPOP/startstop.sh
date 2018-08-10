#!/bin/bash

if [ $1 == "start" ]
then
    if [ ! -d "/dev/net" ];  then
        if [ ! -f "/dev/net/tun" ]; then
            sudo mkdir -p /dev/net
            sudo mknod /dev/net/tun c 10 200
            sudo chmod 600 /dev/net/tun
            sudo cat /dev/net/tun || true
        fi
    else
        echo "TUN TAP exists"
    fi
    sudo ./ipop-tincan &
    sudo python3 -m controller.Controller -c ./config/ipop-config.json &
fi

if [ $1 == "stop" ]
then
    sudo killall ipop-tincan  
    ps aux | grep -v grep | grep controller.Controller | awk '{print $2}' | xargs sudo kill -9
fi

