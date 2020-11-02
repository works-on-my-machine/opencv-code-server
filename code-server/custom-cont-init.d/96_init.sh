#!/bin/bash
HOME_DIR=/config

echo "[ Creating projects path ]"
mkdir -p /projects && chown -R abc:abc /projects

echo "[ Setting code-server settings.json ]"
mkdir -p $HOME_DIR/data/User
cp $HOME_DIR/settings.json $HOME_DIR/data/User/settings.json

echo "[ Setting permissions on home folder ]"
chown -R abc:abc $HOME_DIR