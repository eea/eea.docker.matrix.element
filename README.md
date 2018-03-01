# Docker image for Riot web site

Docker image for https://github.com/vector-im/riot-web/ installed on an NGINX web server.

Integration enabled by default.

## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.matrix.riot/blob/master/Dockerfile)
- [`v0.13.4` (*Dockerfile*)](https://github.com/eea/eea.docker.matrix.riot/blob/v0.13.4/Dockerfile)
- [`v0.13.5` (*Dockerfile*)](https://github.com/eea/eea.docker.matrix.riot/blob/v0.13.5/Dockerfile)

## Variables

HOME_SERVER_URL: Matrix service URL
IDENTITY_SERVER_URL: Matrix identity service URL

## Usage

```
docker run -d -p 8080:80 -v /tmp/data:/data eeacms/matrix-riotweb
```

## Customize riot theme

It builds from source and adds ( or overwrites) the themes directory to src/skins/vector/css/themes/.

You can use it:

1. change scss files in the themes local folder or add new theme as described in https://github.com/vector-im/riot-web/blob/master/docs/theming.md
2. docker build -t riot .
3. docker run --rm -p 8282:80 -e HOME_SERVER_URL=https://matrix.devel2amazon.eea.europa.eu -e IDENTITY_SERVER_URL=https://matrix-identity.devel2amazon.eea.europa.eu riot
4. access in browser - port 8282