#!/bin/bash
export HOME=/home/ubuntu # not set on default

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update

# python3.10
sudo apt-get install -y python3.10

# pip and fastapi
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.10 get-pip.py
sudo pip install "fastapi[all]"
sudo pip install mysql-connector-python

# clone here
git clone https://github.com/developingcow/p5.git
cd p5

# run the app
uvicorn app:app --host 0.0.0.0 --port 1234
