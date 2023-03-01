#!/bin/bash
docker compose up -d --build
docker cp ./nginx.conf lavagna_nginx:/etc/nginx/conf.d/default.conf
docker exec -it lavagna_nginx nginx -s reload
