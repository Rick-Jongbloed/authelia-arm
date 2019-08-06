FROM arm32v7/node:8.15-slim

WORKDIR /usr/src

COPY package.json /usr/src/authelia/package.json

RUN ls -la \
    && ls authelia -la \
    && apt update \
    && apt install -y \
        python \
        make \
        g++ \
    && npm install --production \
    && rm -rf /var/lib/apt/lists/*``` 

COPY authelia/dist/server /usr/src/server

EXPOSE 9091

VOLUME /etc/authelia
VOLUME /var/lib/authelia

CMD ["node", "server/src/index.js", "/etc/authelia/config.yml"]