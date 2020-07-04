FROM node:12.18.2-alpine3.11

ENV NODE_ENV=production
ENV PATH=$PATH:/home/launchql/bin
RUN mkdir -p /home/launchql/bin
RUN apk --no-cache add git
RUN apk add --no-cache bash
RUN apk add --no-cache make
RUN apk add --update alpine-sdk
RUN apk --no-cache add python

# install with gyp BS
RUN apk add --no-cache --virtual .gyp python make g++ \
    && npm install @launchql/server@0.16.2 --allow-root --unsafe-perm \
    && apk del .gyp

# lql command
RUN echo '#!/bin/bash' > /home/launchql/bin/launchql
RUN echo "/node_modules/@launchql/server/dist/cjs/server.js \$@" >> /home/launchql/bin/launchql
RUN chmod +x /home/launchql/bin/launchql
RUN cp /home/launchql/bin/launchql /home/launchql/bin/lql

ENTRYPOINT ["/bin/bash"]
