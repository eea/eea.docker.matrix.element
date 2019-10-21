FROM vectorim/riot-web:v1.5.0
LABEL maintainer="EEA: IDM2 A-Team <eea-edw-a-team-alerts@googlegroups.com>"



COPY html/welcome.html /app/welcome.html
COPY html/img/eea_logo.svg    /app/welcome/images/eea_logo.svg
 


COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 80
STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
