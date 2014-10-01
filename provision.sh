#!/bin/bash

sudo echo "Europe/Berlin" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
sudo apt-get install -y build-essential curl git libssl-dev man mongodb-clients

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
echo "source ~/.nvm/nvm.sh" >> ~/.profile
source ~/.profile

nvm install 0.10
nvm alias default 0.10

npm install -g browserify
npm install -g eslint
npm install -g grunt-cli
npm install -g http-server
npm install -g mocha
npm install -g uglify-js

echo "cd ~/projects" >> ~/.profile

ssh-keyscan github.com >> ~/.ssh/known_hosts

echo
echo "Everything done, have a nice day :-)!"
