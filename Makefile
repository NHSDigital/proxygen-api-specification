install:
	curl -fsSL https://quobix.com/scripts/install_vacuum.sh | sh > /dev/null

lint:
	vacuum lint -d --base specification/ specification/proxygen.yaml
