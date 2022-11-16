#! /bin/sh
#Setup Ruby
apt update
apt install -y ruby-full ruby-bundler build-essential
# Installing Mongodb
curl -fsSL https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
# tee — команда, выводит на экран, или же перенаправляет выходной материал команды и копирует его в файл или в переменную
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
# Since instances run startup scripts as root, and we don't want our web-server to have such privileges,
# we need to use either runuser or su to workaround that.
# For reference:
# https://www.cyberciti.biz/open-source/command-line-hacks/linux-run-command-as-different-user/
runuser -l baggurd -c 'git clone -b monolith https://github.com/express42/reddit.git'
runuser -l baggurd -c 'cd reddit && bundle install'
runuser -l baggurd -c 'cd reddit && puma -d'
