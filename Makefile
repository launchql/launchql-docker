
build10:
	docker build -t pyramation/launchql:0.5.5-node-10.21.0 node-10.21.0/launchql/
	docker build -t pyramation/sqitch-node:10.21.0 --build-arg VERSION=1.1.0  node-10.21.0/sqitch-node/
	docker build -t pyramation/sqitch-alpine:10.21.0 node-10.21.0/sqitch-alpine/
	docker build -t pyramation/launchql-cli:0.5.5-node-10.21.0 node-10.21.0/launchql-cli/

build12:
	docker build -t pyramation/launchql:0.5.5-node-12.18.2 node-12.18.2/launchql/
	docker build -t pyramation/sqitch-node:12.18.2 --build-arg VERSION=1.1.0  node-12.18.2/sqitch-node/
	docker build -t pyramation/sqitch-alpine:12.18.2 node-12.18.2/sqitch-alpine/
	docker build -t pyramation/launchql-cli:0.5.5-node-12.18.2 node-12.18.2/launchql-cli/

alpine:
	docker build -t pyramation/launchql-cli:0.5.5-alpine-12.18.2 node-12.18.2/launchql-cli-alpine/

build14:
	docker build -t pyramation/launchql:0.5.5-node-14.5.0 node-14.5.0/launchql/
	docker build -t pyramation/sqitch-node:14.5.0 --build-arg VERSION=1.1.0  node-14.5.0/sqitch-node/
	docker build -t pyramation/sqitch-alpine:14.5.0 node-14.5.0/sqitch-alpine/
	docker build -t pyramation/launchql-cli:0.5.5-node-14.5.0 node-14.5.0/launchql-cli/

run14:
	docker run -it pyramation/launchql:0.5.5-node-14.5.0

run12:
	docker run -it pyramation/launchql:0.5.5-node-12.18.2

run10:
	docker run -it pyramation/launchql:0.5.5-node-10.21.0

push10:
	docker push pyramation/launchql:0.5.5-node-10.21.0
	docker push pyramation/sqitch-node:10.21.0
	docker push pyramation/launchql-cli:0.5.5-node-10.21.0

push12:
	docker push pyramation/launchql:0.5.5-node-12.18.2
	docker push pyramation/sqitch-node:12.18.2
	docker push pyramation/launchql-cli:0.5.5-node-12.18.2

push14:
	docker push pyramation/launchql:0.5.5-node-14.5.0
	docker push pyramation/sqitch-node:14.5.0
	docker push pyramation/launchql-cli:0.5.5-node-14.5.0

push:
	docker push pyramation/launchql:0.5.5-node-10.21.0
	docker push pyramation/sqitch-node:10.21.0
	docker push pyramation/launchql-cli:0.5.5-node-10.21.0
	docker push pyramation/launchql:0.5.5-node-12.18.2
	docker push pyramation/sqitch-node:12.18.2
	docker push pyramation/launchql-cli:0.5.5-node-12.18.2
	docker push pyramation/launchql:0.5.5-node-14.5.0
	docker push pyramation/sqitch-node:14.5.0
	docker push pyramation/launchql-cli:0.5.5-node-14.5.0
