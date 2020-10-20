FROM node:12.18.2-alpine3.11

ENV NODE_ENV=production
ENV PATH=$PATH:/home/launchql/bin
ARG VERSION

RUN mkdir -p /home/launchql/bin && \
    apk add --no-cache bash && \
    apk add --update --no-cache alpine-sdk python

ENTRYPOINT ["/bin/bash"]

