FROM pyramation/sqitch-alpine:10.21.0

ENV NODE_ENV=production
ENV PATH=$PATH:/home/launchql/bin
RUN mkdir -p /home/launchql/bin
RUN apk --no-cache add git
RUN apk add --no-cache bash
RUN apk add --no-cache make
RUN apk add --update --no-cache --virtual .build-deps alpine-sdk python 
RUN apk --no-cache add postgresql-client

# install with gyp
RUN npm install @launchql/cli@0.5.5 --allow-root --unsafe-perm 
    
# lql command
RUN echo '#!/bin/bash' > /home/launchql/bin/launchql
RUN echo "/node_modules/@launchql/cli/main/index.js \$@" >> /home/launchql/bin/launchql
RUN chmod +x /home/launchql/bin/launchql
RUN cp /home/launchql/bin/launchql /home/launchql/bin/lql

RUN apk del .build-deps

ENTRYPOINT ["/bin/bash"]