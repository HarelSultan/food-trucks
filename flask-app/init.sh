#!/bin/bash
docker build -t food-truck:latest .
docker build --target export-stage --output type=local,dest=html .
rm -rf html/static/src
docker-compose up -d --build