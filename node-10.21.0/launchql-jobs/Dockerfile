FROM node:10.21.0-alpine3.11

ENV NODE_ENV=production
ENV PATH=$PATH:/home/launchql/bin
ARG VERSION

RUN mkdir -p /home/launchql/bin && \
    apk add --no-cache bash && \
    apk add --update --no-cache --virtual .build-deps alpine-sdk python && \
    npm install @launchql/openfaas-job-service@$VERSION --allow-root --unsafe-perm && \
    echo '#!/bin/bash' > /home/launchql/bin/launchql && \
    echo "/node_modules/@launchql/openfaas-job-service/main/run.js \$@" >> /home/launchql/bin/faas-job-service && \
    chmod +x /home/launchql/bin/faas-job-service && \
    apk del .build-deps

ENTRYPOINT ["faas-job-service"]
