#!/bin/bash
docker-compose down
rm .env
rm opencv-nginx-proxy/conf.d/opencv-code-server.conf
rm opencv-nginx-proxy/conf.d/opencv-novnc.conf
