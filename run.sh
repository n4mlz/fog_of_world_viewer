#!/bin/bash

cd $(dirname $0)

rclone sync "dropbox:/アプリ/Fog of World" data

docker compose up -d
