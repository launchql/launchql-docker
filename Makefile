
def:
	$(MAKE) sqitch
	$(MAKE) cli
	$(MAKE) launchql

push:
	docker push pyramation/sqitch:10.21.0-alpine3.11
	docker push pyramation/sqitch:12.18.2-alpine3.11
	docker push pyramation/sqitch:14.5.0-alpine3.11
	docker push pyramation/launchql:0.5.5-10.21.0-alpine3.11
	docker push pyramation/launchql:0.5.5-12.18.2-alpine3.11
	docker push pyramation/launchql:0.5.5-14.5.0-alpine3.11
	docker push pyramation/launchql-cli:0.5.5-10.21.0-alpine3.11
	docker push pyramation/launchql-cli:0.5.5-12.18.2-alpine3.11
	docker push pyramation/launchql-cli:0.5.5-14.5.0-alpine3.11

launchql:
	docker build -t pyramation/launchql:0.5.5-10.21.0-alpine3.11 node-10.21.0/launchql/
	docker build -t pyramation/launchql:0.5.5-12.18.2-alpine3.11 node-12.18.2/launchql/
	docker build -t pyramation/launchql:0.5.5-14.5.0-alpine3.11 node-14.5.0/launchql/

sqitch:
	docker build -t pyramation/sqitch:10.21.0-alpine3.11 node-10.21.0/sqitch/ --build-arg VERSION=1.1.0
	docker build -t pyramation/sqitch:12.18.2-alpine3.11 node-12.18.2/sqitch/ --build-arg VERSION=1.1.0 
	docker build -t pyramation/sqitch:14.5.0-alpine3.11 node-14.5.0/sqitch/ --build-arg VERSION=1.1.0 

cli:
	docker build -t pyramation/launchql-cli:0.5.5-10.21.0-alpine3.11 node-10.21.0/launchql-cli/
	docker build -t pyramation/launchql-cli:0.5.5-12.18.2-alpine3.11 node-12.18.2/launchql-cli/
	docker build -t pyramation/launchql-cli:0.5.5-14.5.0-alpine3.11 node-14.5.0/launchql-cli/

# run14:
# 	docker run -it pyramation/launchql:0.5.5-node-14.5.0

# run12:
# 	docker run -it pyramation/launchql:0.5.5-node-12.18.2

# run10:
# 	docker run -it pyramation/launchql:0.5.5-node-10.21.0
