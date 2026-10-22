# Build the viewer from the pinned parser source.
FROM python:3.10-slim

WORKDIR /app

COPY vendor/fog-of-world-data-parser/ ./

RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc zlib1g-dev libjpeg-dev libpng-dev libtiff-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir --requirement requirements.txt

CMD ["python", "main.py", "/data"]
