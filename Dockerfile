FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git gcc zlib1g-dev libjpeg-dev libpng-dev libtiff-dev && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/CaviarChen/Fog-of-World-Data-Parser /app

RUN pip install --no-cache-dir -r requirements.txt
