FROM pyramation/sqitch-node:10.21.0

ENV NODE_ENV=production
ENV PATH=$PATH:/home/launchql/bin
RUN mkdir -p /home/launchql/bin

RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install \
        git \
        make \
        gcc \
        build-essential \
        python \
        libpq5 \
        postgresql-client \
    && apt-get clean  && \
        rm -rf /var/lib/apt/lists/*

# install with gyp BS
RUN npm install @launchql/cli@0.5.5 --allow-root --unsafe-perm 
    
# lql command
RUN echo '#!/bin/bash' > /home/launchql/bin/launchql
RUN echo "/node_modules/@launchql/cli/main/index.js \$@" >> /home/launchql/bin/launchql
RUN chmod +x /home/launchql/bin/launchql
RUN cp /home/launchql/bin/launchql /home/launchql/bin/lql

ENTRYPOINT ["/bin/bash"]