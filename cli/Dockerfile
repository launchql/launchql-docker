FROM pyramation/sqitch:12.18.2-alpine3.11

# Create a group and user
RUN addgroup -S sqitch && adduser -S sqitch -G sqitch

# Tell docker that all future commands should run as the sqitch user
USER sqitch
WORKDIR /repo
ENTRYPOINT ["/bin/sqitch"]
CMD ["help"]
