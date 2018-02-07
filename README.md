# Docker image for Riot web site

Docker image for https://github.com/vector-im/riot-web/ installed on an NGINX web server.

Integration enabled by default.

## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.matrix.riot/blob/master/Dockerfile)
- [`v0.13.4` (*Dockerfile*)](https://github.com/eea/eea.docker.matrix.riot/blob/v0.13.4/Dockerfile)

## Variables

HOME_SERVER_URL: Matrix service URL
IDENTITY_SERVER_URL: Matrix identity service URL

## Usage

```
docker run -d -p 8080:80 -v /tmp/data:/data eeacms/matrix-riotweb
```
