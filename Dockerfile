FROM node:lts-bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git config --global url."https://github.com/".insteadOf "ssh://git@github.com/" && \
    git config --global url."https://github.com/".insteadOf "git@github.com:"

WORKDIR /app

COPY package.json .

RUN npm install --omit=dev && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
