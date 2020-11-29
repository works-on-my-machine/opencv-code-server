#!/bin/bash
HOME_DIR=/config

# Install oh-my-bash
echo "[ Installing oh-my-bash ]"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sed -i 's/OSH_THEME="font"/OSH_THEME="roderik"/g' $HOME_DIR/.bashrc

echo "[ Creating projects path ]"
mkdir -p /projects && chown -R abc:abc /projects

echo "[ Setting code-server settings.json ]"
mkdir -p $HOME_DIR/data/User
cp $HOME_DIR/settings.json $HOME_DIR/data/User/settings.json

echo "[ Setting permissions on home folder ]"
chown -R abc:abc $HOME_DIR