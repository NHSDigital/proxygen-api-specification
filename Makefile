install:
	npm install -g @quobix/vacuum@0.16.1

lint:
	vacuum lint -d --base specification/ specification/proxygen.yaml
