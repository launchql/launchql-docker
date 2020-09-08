FROM node:12.18.2-alpine3.11

ENV NODE_ENV=production
ENV PATH=$PATH:/home/launchql/bin
ARG VERSION

RUN mkdir -p /home/launchql/bin && \
    apk add --no-cache bash && \
    apk add --update --no-cache --virtual .build-deps alpine-sdk python && \
    npm install @launchql/server@$VERSION --allow-root --unsafe-perm && \
    echo '#!/bin/bash' > /home/launchql/bin/launchql && \
    echo "/node_modules/@launchql/server/dist/cjs/server.js \$@" >> /home/launchql/bin/launchql && \
    chmod +x /home/launchql/bin/launchql && \
    apk del .build-deps

ENTRYPOINT ["/bin/bash"]

