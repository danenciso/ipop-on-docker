FROM ubuntu:16.04

WORKDIR /root/
# install dependencies
RUN apt -y update
RUN apt -y install sudo

# install ipop dependencies
RUN sudo apt install -y software-properties-common libssl-dev || \
    {sudo apt update; sudo apt update --fix-missing; sudo apt install -y software-properties-common libssl-dev || sudo apt install -yf software-properties-common libssl-dev; }
RUN sudo apt install -y python3.5 python3-pip python-dev || \
    {sudo apt update; sudo apt update --fix-missing; sudo apt install -y python3.5 python3-pip python-dev || sudo apt install -yf python3.5 python3-pip python-dev; }
RUN sudo pip3 install -v sleekxmpp==1.3.1  
RUN sudo pip3 install psutil pystun
RUN sudo apt install -y bridge-utils

# helpful
RUN sudo apt install -y psmisc
RUN sudo apt install -y net-tools iputils-ping

# download ipop
RUN sudo apt install -y wget
ARG ipoptarurl
ARG ipoptarname
ARG ipopfoldername
RUN wget $ipoptarurl
RUN tar -xzvf $ipoptarname
RUN rm $ipoptarname
RUN cd $ipopfoldername

# add usuable script to launch and kill IPOP
COPY startstop.sh $ipopfoldername

# clean up container
RUN rm -rf /var/lib/apt/lists/*
RUN sudo apt autoclean
RUN sudo apt clean

# expose some ports for Tincan and Controller
EXPOSE 5800:5800/udp
EXPOSE 5801:5801/udp

