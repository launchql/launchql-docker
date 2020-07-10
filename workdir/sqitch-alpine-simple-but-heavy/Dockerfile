FROM node:12.18.2-alpine3.11

ENV TZ UTC

# TODO working on minimizing size of this...
# https://www.sandtable.com/reduce-docker-image-sizes-using-alpine/
# use 1 RUN command also helps!

# instead of cpan Crypt::OpenPGP we use apk add gnupg
# https://github.com/audreyt/module-signature/issues/30

# https://rollout.io/blog/alpine-based-docker-images-make-difference-real-world-apps/
ENV PERL_MM_USE_DEFAULT=1
RUN apk add --no-cache --virtual .build-deps g++ make perl-dev tzdata postgresql-dev perl-dbd-pg gnupg && \
	cp /usr/share/zoneinfo/UTC /etc/localtime && \
	echo UTC > /etc/timezone && \
	apk add --no-cache perl && \	
 	cpan List::MoreUtils && \
	# cpan Crypt::Random && \
	# apk add --no-cache gnupg && \
	# cpan Text::Levenshtein::XS && \
	cpan DBD::Pg && \
	cpan App::Sqitch 

RUN apk del .build-deps

ENTRYPOINT ["/bin/bash"]