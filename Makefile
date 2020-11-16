sqitch = 1.1.0
alpine = alpine3.11

cli = 1.1.0
jobs = 0.2.3
server = 0.19.31

node12 = 12.18.2
node14 = 14.5.0

all: sqitch launchql-cli launchql-jobs launchql sqitch-cli

lql: launchql-cli launchql push latest
lqlpush: push latest

echo:
	docker tag pyramation/sqitch:$(node12)-$(alpine) pyramation/sqitch:latest
	docker tag pyramation/launchql:$(server)-$(node12)-$(alpine) pyramation/launchql:latest
	docker tag pyramation/launchql-cli:$(cli)-$(node12)-$(alpine) pyramation/launchql-cli:latest
	docker tag pyramation/launchql-jobs:$(jobs)-$(node12)-$(alpine) pyramation/launchql-jobs:latest

latest:
	docker tag pyramation/sqitch:$(node12)-$(alpine) pyramation/sqitch:latest
	docker push pyramation/sqitch:latest
	docker tag pyramation/launchql:$(server)-$(node12)-$(alpine) pyramation/launchql:latest
	docker push pyramation/launchql:latest
	docker tag pyramation/launchql-cli:$(cli)-$(node12)-$(alpine) pyramation/launchql-cli:latest
	docker push pyramation/launchql-cli:latest
	docker tag pyramation/launchql-jobs:$(jobs)-$(node12)-$(alpine) pyramation/launchql-jobs:latest
	docker push pyramation/launchql-jobs:latest
	
push:
	docker push pyramation/sqitch:$(node12)-$(alpine)
	docker push pyramation/launchql:$(server)-$(node12)-$(alpine)
	docker push pyramation/launchql-cli:$(cli)-$(node12)-$(alpine)
	docker push pyramation/launchql-jobs:$(jobs)-$(node12)-$(alpine)
	docker push pyramation/node-gyp:$(jobs)-$(node12)-$(alpine)



sqitch-cli:
	docker build -t pyramation/sqitch-cli:$(node12)-$(alpine) ./cli
	docker tag pyramation/sqitch-cli:$(node12)-$(alpine) pyramation/sqitch-cli:latest

launchql:
	docker build -t pyramation/launchql:$(server)-$(node12)-$(alpine) node-$(node12)/launchql/ --build-arg VERSION=$(server)

jobs:
	docker build -t pyramation/launchql-jobs:$(jobs)-$(node12)-$(alpine) node-$(node12)/launchql-jobs/ --build-arg VERSION=$(jobs)

sqitch:
	docker build -t pyramation/sqitch:$(node12)-$(alpine) node-$(node12)/sqitch/ --build-arg VERSION=$(sqitch) 

launchql-cli:
	docker build -t pyramation/launchql-cli:$(cli)-$(node12)-$(alpine) node-$(node12)/launchql-cli/ --build-arg VERSION=$(cli)

launchql-jobs:
	docker build -t pyramation/launchql-jobs:$(jobs)-$(node12)-$(alpine) node-$(node12)/launchql-jobs/ --build-arg VERSION=$(jobs)

node-gyp:
	docker build -t pyramation/node-gyp:$(jobs)-$(node12)-$(alpine) node-$(node12)/node-gyp/ 
