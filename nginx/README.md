## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/dockerfile/nginx/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/dockerfile/nginx/) from public [Docker Registry](https://index.docker.io/): `docker pull dockerfile/nginx`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/nginx" github.com/dockerfile/nginx`)


### Usage

    docker run -d -p 80:80 dockerfile/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <log-dir>:/var/log/nginx dockerfile/nginx

After few seconds, open `http://<host>` to see the welcome page.
