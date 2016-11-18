Docker-Blockchain-Explorer
===
Docker images for [Hyperledger Blockchain Explorer](https://github.com/hyperledger/blockchain-explorer).

# Supported tags and respective Dockerfile links

* [`latest` (latest/Dockerfile)](https://github.com/yeasy/docker-blockchain-explorer/blob/master/Dockerfile): Default to use latest code on master branch.

For more information about this image and its history, please see the relevant manifest file in the [`yeasy/docker-blockchain-explorer` GitHub repo](https://github.com/yeasy/docker-blockchain-explorer).

If you want to quickly deploy a local cluster with explorer enabled, please refer to [Start hyperledger cluster using Compose](https://github.com/yeasy/docker-compose-files#hyperledger).

# What is docker-blockchain-explorer?
Docker image with an web-UI explorer for a running hyperledger chain.

# How to use this image?
The docker image is auto built at [https://registry.hub.docker.com/u/yeasy/blockchain-explorer/](https://registry.hub.docker.com/u/yeasy/blockchain-explorer/).

## In Dockerfile
```sh
FROM yeasy/blockchain-explorer:latest
```

## Local Run 

### Quick start

The easiest way to start a explorer is just run

```sh
$ docker run -d yeasy/blockchain-explorer
```

It will listen on `<container>:9090`, and try connect to `127.0.0.1:7050` as the hyperledger fabric rest api url.

### With configuration

Environment variables are supported:

* HTTP_PORT=<web server port. Default is 9090 if not set>
* HYP_REST_ENDPOINT=<REST endpoint. Default is http://127.0.0.1:7050 if not set>

E.g., suppose the hyperledger rest api url is `http://172.17.0.2:7050`.

```sh
$ docker run -p 9090:9090 -e HYP_REST_ENDPOINT=http://172.17.0.2:7050 yeasy/blockchain-explorer
```

# Which image is based on?
The image is built based on [node:6-wheezy](https://hub.docker.com/r/library/node/) base image.

# What has been changed?
## Install dependencies
Install required tools
```sh
$ npm install npm bower grunt-cli graceful-fs@4.1.5 minimatch@3.0.2 -g
$ apk update && apk add git
```

## Clone code from github and install dependencies
```sh
$ git clone https://github.com/hyperledger/blockchain-explorer
$ cd blockchain-explorer/explorer_1
$ npm install grunt grunt-auto-install grunt-contrib-uglify grunt-contrib-copy
$ grunt
```

## Start the project

```sh
$ node exp-server.js
```

# Supported Docker versions

This image is officially supported on Docker version 1.9.0+.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# Known Issues
* N/A.

# User Feedback
## Documentation
Be sure to familiarize yourself with the [repository's `README.md`](https://github.com/yeasy/docker-blockchain-explorer/blob/master/README.md) file before attempting a pull request.

## Issues
If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/yeasy/docker-blockchain-explorer/issues).

You can also reach many of the official image maintainers via the email.

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/yeasy/docker-blockchain-explorer/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
