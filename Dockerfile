# Build the viewer from the pinned parser source.
FROM python:3.10-slim

WORKDIR /app

COPY vendor/fog-of-world-data-parser/ ./

RUN pip install --no-cache-dir --requirement requirements.txt

CMD ["python", "main.py", "/data"]
