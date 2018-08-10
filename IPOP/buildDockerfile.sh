#!/bin/bash

imageName=$1
echo $imageName

# change these fields depending on the version that is desired
url="https://github.com/ipop-project/Downloads/releases/download/v18.b3/ipop-vpn-18.b3-ubuntu.tar.gz"
tarname="ipop-vpn-18.b3-ubuntu.tar.gz"
foldername="ipop-vpn-18.b3-ubuntu"

docker build --tag $imageName --build-arg ipoptarurl=$url \
		       --build-arg ipoptarname=$tarname \
		       --build-arg ipopfoldername=$foldername .

docker images $imageName
