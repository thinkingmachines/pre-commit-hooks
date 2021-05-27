.PHONY: clean clean-test clean-pyc clean-build dev venv help requirements-dev.txt
.DEFAULT_GOAL := help

help:
	@awk -F ':.*?## ' '/^[a-zA-Z]/ && NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

dev: venv requirements-dev.txt  ## setup dev environment
	venv/bin/pip-sync requirements-dev.txt

venv:  ## create virtual environment
	python3 -m venv venv
	venv/bin/pip3 install pip-tools

requirements.txt: requirements.in  ## create requirements
	venv/bin/pip-compile -o requirements.txt requirements.in

requirements-dev.txt: requirements-dev.in  ## create dev requirements
	venv/bin/pip-compile -o requirements-dev.txt requirements-dev.in

clean: clean-build clean-pyc clean-test  ## remove all build, test, coverage and Python artifacts

clean-build:  ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/

clean-pyc:  ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:  ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/

dist: clean  ## build source and wheel package
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist
