FROM node:12.18.2-alpine3.11

ENV TZ UTC

ENV PERL_MM_USE_DEFAULT=1
RUN apk add --no-cache --virtual .build-deps g++ make perl-dev tzdata postgresql-dev perl-dbd-pg && \
	cp /usr/share/zoneinfo/UTC /etc/localtime && \
	echo UTC > /etc/timezone && \
	apk add --no-cache perl;

RUN cpan List::MoreUtils;
RUN cpan Crypt::Random

# RUN cpan Crypt::OpenPGP
# https://github.com/audreyt/module-signature/issues/30
RUN apk add --no-cache gnupg

RUN cpan Text::Levenshtein::XS
RUN cpan DBD::Pg
RUN cpan App::Sqitch

RUN apk del .build-deps

ENTRYPOINT ["/bin/bash"]