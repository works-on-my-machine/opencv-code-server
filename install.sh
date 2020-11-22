#!/bin/bash
cp .envtmp .env
sed -i "s|CERTIFICATE_PATH=|CERTIFICATE_PATH=${CERTIFICATE_PATH}|g" .env
sed -i "s|CERTIFICATE_KEY_PATH=|CERTIFICATE_KEY_PATH=${CERTIFICATE_KEY_PATH}|g" .env
sed -i "s|NOVNC_WIDTH=|NOVNC_WIDTH=${NOVNC_WIDTH}|g" .env
sed -i "s|NOVNC_HEIGHT=|NOVNC_HEIGHT=${NOVNC_HEIGHT}|g" .env
sed -i "s|CODE_SERVER_PUID=|CODE_SERVER_PUID=${CODE_SERVER_PUID}|g" .env
sed -i "s|CODE_SERVER_PGID=|CODE_SERVER_PGID=${CODE_SERVER_PGID}|g" .env
sed -i "s|CODE_SERVER_PASSWORD=|CODE_SERVER_PASSWORD=${CODE_SERVER_PASSWORD}|g" .env
sed -i "s|CODE_SERVER_SUDO_PASSWORD=|CODE_SERVER_SUDO_PASSWORD=${CODE_SERVER_SUDO_PASSWORD}|g" .env
sed -i "s|CODE_SERVER_CONFIG_VOLUME=|CODE_SERVER_CONFIG_VOLUME=${CODE_SERVER_CONFIG_VOLUME}|g" .env
sed -i "s|CODE_SERVER_PROJECTS_VOLUME=|CODE_SERVER_PROJECTS_VOLUME=${CODE_SERVER_PROJECTS_VOLUME}|g" .env

cp opencv-nginx-proxy/conf.d/opencv-code-server.conftmp opencv-nginx-proxy/conf.d/opencv-code-server.conf
sed -i "s|{{CODE_SERVER_DNS}}|${CODE_SERVER_DNS}|g" opencv-nginx-proxy/conf.d/opencv-code-server.conf
cp opencv-nginx-proxy/conf.d/opencv-novnc.conftmp opencv-nginx-proxy/conf.d/opencv-novnc.conf
sed -i "s|{{NOVNC_DNS}}|${NOVNC_DNS}|g" opencv-nginx-proxy/conf.d/opencv-novnc.conf

docker-compose up -d