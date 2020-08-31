FROM pyramation/sqitch:14.5.0-alpine3.11

ENV NODE_ENV=production
ENV PATH=$PATH:/home/launchql/bin
ARG VERSION

RUN mkdir -p /home/launchql/bin && \
    apk add --no-cache bash && \
    apk add --update --no-cache --virtual .build-deps alpine-sdk python && \
    apk --no-cache add postgresql-client && \
    npm install @launchql/cli@$VERSION --allow-root --unsafe-perm  && \
    echo '#!/bin/bash' > /home/launchql/bin/launchql && \
    echo "/node_modules/@launchql/cli/main/index.js \$@" >> /home/launchql/bin/launchql && \
    chmod +x /home/launchql/bin/launchql && \
    cp /home/launchql/bin/launchql /home/launchql/bin/lql && \
    apk del .build-deps

ENTRYPOINT ["/bin/bash"]