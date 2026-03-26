FROM node:lts-bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json .

RUN npm install --omit=dev && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
