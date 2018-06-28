# Docker image for Riot web site

Docker image for https://github.com/vector-im/riot-web/ installed on an NGINX web server.

Integration enabled by default.

## Supported tags and respective Dockerfile links

  - [Tags](https://hub.docker.com/r/eeacms/matrix-riotweb/tags/)

## Base docker image

 - [eeacms/matrix-riotweb](https://hub.docker.com/r/eeacms/matrix-riotweb/)

## Source code

  - [eea/eea.docker.matrix.riot](http://github.com/eea/eea.docker.matrix.riot)

## Variables

* `HOME_SERVER_URL` - Matrix service URL
* `IDENTITY_SERVER_URL` - Matrix identity service URL
* `BRAND` - Matrix custom brand name, e.g. your company name, defaults to 'Riot'

## Usage

```
docker run -d -p 8080:80 -v /tmp/data:/data eeacms/matrix-riotweb
```

## Copyright and license

The Initial Owner of the Original Code is European Environment Agency (EEA).
All Rights Reserved.

The Original Code is free software; you can redistribute it and/or modify
it under the terms of the Apache License as published by the Apache Software Foundation (ASF);
either version 2 of the License, or (at your option) any later version.

## Funding

[European Environment Agency (EU)](http://eea.europa.eu)

# Extending this image

## Customize riot home page

It builds from source and overrides the Riot source homepage with the one in this repo /html/home.html.

You can use customise the homepage by:

2. change HTML pages in html folder
3. docker build -t riot .
4. docker run --rm -p 8282:80 -e HOME_SERVER_URL=https://matrix.eea.europa.eu -e IDENTITY_SERVER_URL=https://matrix-identity.eea.europa.eu riot
5. access in browser - port 8282

## Add more configurations to Riot

If youn want to add more configuration to this Riot image you need to extend the
envrionment variables in the docker-entrypoint.sh which generates the riot 
configjson dynamically. 

For all available riot configuration see:
https://github.com/vector-im/riot-web/blob/master/README.md#configjson