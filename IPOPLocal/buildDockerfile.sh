#!/bin/bash

# Daniel Enciso

# loop through the file and set the values
imageName=$1 # ipop-local:1.0
# this field depends on the ipop version installed (i.e. the Docker images)
foldername=$2 #"ipop-vpn-18.b3-ubuntu"

# modify the config file to have specific parameters
python setupconfig.py

# depending on the Docker installation OS, environment is slightly different
if [ $2 == "mac" ]
then
    cp Dockerfiles/MacWin_Dockerfile Dockerfile
    docker build --tag $imageName --build-arg ipop_path=$foldername --build-arg os_set="mac" .
elif [ $2 == "win" ]
then
    cp Dockerfiles/MacWin_Dockerfile Dockerfile
    docker build --tag $imageName --build-arg ipop_path=$foldername --build-arg os_set="win" .
else
    cp Dockerfiles/Ubuntu_Dockerfile Dockerfile
    docker build --tag $imageName --build-arg ipop_path=$foldername .
fi

# verify image was built
docker images $imageName

