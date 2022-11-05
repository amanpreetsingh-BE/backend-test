install:
	pip3 install --upgrade pip &&\
		pip3 install -r requirements.txt
format:
	black *.py lib/*.py
lint:
	pylint -disable=R,C *.py lib/*.py
test:
	python -m pytest -vv test/main.py
logaws:
	aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 865402607199.dkr.ecr.eu-west-2.amazonaws.com
build:
	docker build -t quantox .
tag:
	docker tag quantox:latest 865402607199.dkr.ecr.eu-west-2.amazonaws.com/quantox:latest
push:
	docker push 865402607199.dkr.ecr.eu-west-2.amazonaws.com/quantox:latest

all: install lint test logaws build tag push