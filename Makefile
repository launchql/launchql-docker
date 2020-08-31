
def:
	$(MAKE) sqitch
	$(MAKE) launchql-cli
	$(MAKE) launchql
	$(MAKE) sqitch-cli

latest:
	docker tag pyramation/sqitch:12.18.2-alpine3.11 pyramation/sqitch:latest
	docker tag pyramation/launchql:0.18.3-12.18.2-alpine3.11 pyramation/launchql:latest
	docker tag pyramation/launchql-cli:0.5.25-12.18.2-alpine3.11 pyramation/launchql-cli:latest
	docker push pyramation/sqitch:latest
	docker push pyramation/launchql:latest
	docker push pyramation/launchql-cli:latest
	
push:
	docker push pyramation/sqitch:10.21.0-alpine3.11
	docker push pyramation/sqitch:12.18.2-alpine3.11
	docker push pyramation/sqitch:14.5.0-alpine3.11
	docker push pyramation/launchql:0.18.3-10.21.0-alpine3.11
	docker push pyramation/launchql:0.18.3-12.18.2-alpine3.11
	docker push pyramation/launchql:0.18.3-14.5.0-alpine3.11
	docker push pyramation/launchql-cli:0.5.25-10.21.0-alpine3.11
	docker push pyramation/launchql-cli:0.5.25-12.18.2-alpine3.11
	docker push pyramation/launchql-cli:0.5.25-14.5.0-alpine3.11

sqitch-cli:
	docker build -t pyramation/sqitch-cli:12.18.2-alpine3.11 ./cli
	docker tag pyramation/sqitch-cli:12.18.2-alpine3.11 pyramation/sqitch-cli:latest

launchql:
	docker build -t pyramation/launchql:0.18.3-10.21.0-alpine3.11 node-10.21.0/launchql/ --build-arg VERSION=0.18.3
	docker build -t pyramation/launchql:0.18.3-12.18.2-alpine3.11 node-12.18.2/launchql/ --build-arg VERSION=0.18.3
	docker build -t pyramation/launchql:0.18.3-14.5.0-alpine3.11 node-14.5.0/launchql/ --build-arg VERSION=0.18.3

sqitch:
	docker build -t pyramation/sqitch:10.21.0-alpine3.11 node-10.21.0/sqitch/ --build-arg VERSION=1.1.0
	docker build -t pyramation/sqitch:12.18.2-alpine3.11 node-12.18.2/sqitch/ --build-arg VERSION=1.1.0 
	docker build -t pyramation/sqitch:14.5.0-alpine3.11 node-14.5.0/sqitch/ --build-arg VERSION=1.1.0 

launchql-cli:
	docker build -t pyramation/launchql-cli:0.5.25-10.21.0-alpine3.11 node-10.21.0/launchql-cli/ --build-arg VERSION=0.5.25
	docker build -t pyramation/launchql-cli:0.5.25-12.18.2-alpine3.11 node-12.18.2/launchql-cli/ --build-arg VERSION=0.5.25
	docker build -t pyramation/launchql-cli:0.5.25-14.5.0-alpine3.11 node-14.5.0/launchql-cli/ --build-arg VERSION=0.5.25

# run14:
# 	docker run -it pyramation/launchql:0.5.5-node-14.5.0

# run12:
# 	docker run -it pyramation/launchql:0.5.5-node-12.18.2

# run10:
# 	docker run -it pyramation/launchql:0.5.5-node-10.21.0
