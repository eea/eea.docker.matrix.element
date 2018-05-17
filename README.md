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
