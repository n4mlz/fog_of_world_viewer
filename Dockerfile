FROM python:3.10-slim

ARG DOMAIN
ARG FOG_OF_WORLD_PARSER_REVISION=3b28a8473f31cb116e035624aa8694faa4d934b2

ENV DOMAIN=${DOMAIN}

WORKDIR /app

RUN apt-get update && apt-get install -y git gcc zlib1g-dev libjpeg-dev libpng-dev libtiff-dev && rm -rf /var/lib/apt/lists/*

RUN git init /app \
    && git -C /app remote add origin https://github.com/CaviarChen/Fog-of-World-Data-Parser.git \
    && git -C /app fetch --depth 1 origin "$FOG_OF_WORLD_PARSER_REVISION" \
    && git -C /app checkout --detach FETCH_HEAD

RUN sed -i "s|http://127\.0\.0\.1|${DOMAIN}|g" main.py && sed -i 's|:{}||g' main.py && sed -i 's|.format(port, |.format(|g' main.py

RUN pip install --no-cache-dir -r requirements.txt

LABEL org.opencontainers.image.source="https://github.com/n4mlz/fog_of_world_viewer"
