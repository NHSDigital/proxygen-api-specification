# BIN directory
BIN := $(THIS_DIR)/node_modules/.bin

# Path
PATH := node_modules/.bin:$(PATH)
SHELL := /bin/bash

install-node:
	npm install

install: install-node

lint:
	vacuum lint -d --base specification/ specification/proxygen.yaml
