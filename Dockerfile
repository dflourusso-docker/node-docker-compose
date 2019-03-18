FROM 'node:10.11.0-alpine'

RUN 'apk update && \
     apk add py-pip && \
     apk add docker && \
     pip install docker-compose && \
     rm -rf /var/cache/apk/'
