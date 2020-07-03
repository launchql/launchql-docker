FROM node:12.18.2-alpine3.11
# FROM node:10.21.0-alpine3.11

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
    && npm install @launchql/cli@0.5.5 --allow-root --unsafe-perm \
    && apk del .gyp

# lql command
RUN echo '#!/bin/bash' > /home/launchql/bin/launchql
RUN echo "/node_modules/@launchql/cli/main/index.js \$@" >> /home/launchql/bin/launchql
RUN chmod +x /home/launchql/bin/launchql
RUN cp /home/launchql/bin/launchql /home/launchql/bin/lql

# add sqitch
ENV TZ UTC

RUN apk add --no-cache postgresql-dev

# RUN apk add --no-cache perl perl-utils
# RUN curl -L https://cpanmin.us/ -o cpanm
# RUN chmod +x cpanm
# RUN cp cpanm /home/launchql/bin/cpanm
# COPY ./src/App-Sqitch-0.9998.tar.gz /home/node/App-Sqitch-0.9998.tar.gz 

# RUN mkdir -p /usr/share/man/man1 /usr/share/man/man7 \
#     apk add build-essential perl curl \
#        unixodbc-dev firebird-dev sqlite libpq-dev libmariadbclient-dev \
#     && cd /home/node \
#     && mkdir src \
#     && tar -zxf App-Sqitch-0.9998.tar.gz --strip-components 1 -C src

RUN apk add --no-cache --virtual build-deps g++ make perl-dev tzdata && \
	cp /usr/share/zoneinfo/UTC /etc/localtime && \
	echo UTC > /etc/timezone && \
	apk add --no-cache perl && \
	cpan App::Sqitch && \
	apk del build-deps


# Install cpan and build dependencies.
# ENV PERL5LIB /work/local/lib/perl5
# RUN curl -sL --compressed https://git.io/cpm > cpm && chmod +x cpm \
#     && ./cpm install -L local --verbose --no-test ExtUtils::MakeMaker \
#     && ./cpm install -L local --verbose --no-test --with-recommends \
#         --with-configure --cpanfile src/dist/cpanfile

# RUN   apk update \                                                                                                                                                                                                                        
#   &&   apk add ca-certificates wget \                                                                                                                                                                                                      
#   &&   update-ca-certificates   # This line may not do anything

# RUN cpan install -L local --verbose --no-test A1z::HTML5::Template
# RUN cpan Module:Build 
# RUN cpan install -L local --verbose --no-test --with-recommends \
        # --with-configure --cpanfile src/dist/cpanfile

#RUN cpan Module::Build Test::Exception Hash::Merge Test::MockModule -n --no-wget

# # Build, test, bundle, prune.
# WORKDIR /work/src
# RUN cd /home/node/src/ && perl Build.PL --quiet --install_base /app --etcdir /etc/sqitch \
#     --config installman1dir= --config installsiteman1dir= --config installman3dir= --config installsiteman3dir= \
#     --with postgres \
#     && ./Build test && ./Build bundle \
#     && rm -rf /app/man \
#     && find /app -name '*.pod' | grep -v sqitch | xargs rm -rf


ENTRYPOINT ["/bin/bash"]
