sqitch = 1.1.0
alpine = alpine3.19

cli = 3.0.0
jobs = 0.3.0
server = 1.0.0

node20 = 20.12.0

all: sqitch launchql-cli launchql-jobs launchql sqitch-cli

lql: launchql-cli launchql push latest
lql-jobs: launchql-cli launchql-jobs launchql push latest
lqlpush: push latest

echo:
	docker tag pyramation/sqitch:$(node20)-$(alpine) pyramation/sqitch:latest
	docker tag pyramation/launchql:$(server)-$(node20)-$(alpine) pyramation/launchql:latest
	docker tag pyramation/launchql-cli:$(cli)-$(node20)-$(alpine) pyramation/launchql-cli:latest
	docker tag pyramation/launchql-jobs:$(jobs)-$(node20)-$(alpine) pyramation/launchql-jobs:latest

latest:
	docker tag pyramation/sqitch:$(node20)-$(alpine) pyramation/sqitch:latest
	docker push pyramation/sqitch:latest
	docker tag pyramation/launchql:$(server)-$(node20)-$(alpine) pyramation/launchql:latest
	docker push pyramation/launchql:latest
	docker tag pyramation/launchql-cli:$(cli)-$(node20)-$(alpine) pyramation/launchql-cli:latest
	docker push pyramation/launchql-cli:latest
	docker tag pyramation/launchql-jobs:$(jobs)-$(node20)-$(alpine) pyramation/launchql-jobs:latest
	docker push pyramation/launchql-jobs:latest
	
push:
	docker push pyramation/sqitch:$(node20)-$(alpine)
	docker push pyramation/launchql:$(server)-$(node20)-$(alpine)
	docker push pyramation/launchql-cli:$(cli)-$(node20)-$(alpine)
	docker push pyramation/launchql-jobs:$(jobs)-$(node20)-$(alpine)
	docker push pyramation/node-gyp:$(jobs)-$(node20)-$(alpine)



sqitch-cli:
	docker build -t pyramation/sqitch-cli:$(node20)-$(alpine) ./cli
	docker tag pyramation/sqitch-cli:$(node20)-$(alpine) pyramation/sqitch-cli:latest

launchql:
	docker build -t pyramation/launchql:$(server)-$(node20)-$(alpine) node-$(node20)/launchql/ --build-arg VERSION=$(server)

jobs:
	docker build -t pyramation/launchql-jobs:$(jobs)-$(node20)-$(alpine) node-$(node20)/launchql-jobs/ --build-arg VERSION=$(jobs)

sqitch:
	docker build -t pyramation/sqitch:$(node20)-$(alpine) node-$(node20)/sqitch/ --build-arg VERSION=$(sqitch) 

launchql-cli:
	docker build -t pyramation/launchql-cli:$(cli)-$(node20)-$(alpine) node-$(node20)/launchql-cli/ --build-arg VERSION=$(cli)

launchql-jobs:
	docker build -t pyramation/launchql-jobs:$(jobs)-$(node20)-$(alpine) node-$(node20)/launchql-jobs/ --build-arg VERSION=$(jobs)

node-gyp:
	docker build -t pyramation/node-gyp:$(jobs)-$(node20)-$(alpine) node-$(node20)/node-gyp/ 
