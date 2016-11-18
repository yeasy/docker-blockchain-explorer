# Dockerfile for Hyperledger blockchain-explorer image
# Workdir is set to /blockchain-explorer/explorer_1

# env:
# HTTP_PORT=<web server port. Default is 9090 if not set>
# HYP_REST_ENDPOINT=<REST endpoint. Default is http://127.0.0.1:7050 if not set>


FROM node:7.1.0-slim
MAINTAINER Baohua Yang

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update \
        && apt-get install -y git npm \
        && rm -rf /var/cache/apt

RUN npm install npm bower grunt-cli graceful-fs@4.1.5 minimatch@3.0.2 -g


# clone latest code from github
RUN git clone https://github.com/hyperledger/blockchain-explorer

WORKDIR /blockchain-explorer/explorer_1

RUN npm install grunt grunt-auto-install grunt-contrib-uglify grunt-contrib-copy && \
    grunt

CMD ["node", "exp-server.js"]
