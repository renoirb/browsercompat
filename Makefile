.PHONY: clean-pyc clean-build docs

help:
	@echo "clean-build - remove build artifacts"
	@echo "clean-pyc - remove Python file artifacts"
	@echo "lint - check style with flake8"
	@echo "test - run tests quickly with the default Python"
	@echo "testall - run tests on every Python version with tox"
	@echo "coverage - check code coverage quickly with the default Python"
	@echo "docs - generate Sphinx HTML documentation, including API docs"
	@echo "release - package and upload a release"
	@echo "sdist - package"

clean: clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

lint:
	flake8 webplatformcompat tests

test:
	./manage.py test

test-all:
	tox

coverage:
	coverage erase
	coverage run --source webplatformcompat setup.py test
	coverage report -m
	coverage html
	open htmlcov/index.html

docs:
	rm -f docs/webplatformcompat.rst
	rm -f docs/modules.rst
	sphinx-apidoc -o docs/ webplatformcompat
	$(MAKE) -C docs clean
	$(MAKE) -C docs html
	open docs/_build/html/index.html

release: clean
	python setup.py sdist upload
	python setup.py bdist_wheel upload

sdist: clean
	python setup.py sdist
	ls -l dist
	check-manifest
	pyroma dist/`ls -t dist | head -n1`; if [ $$? -ne 1 ]; then exit 1; fi
