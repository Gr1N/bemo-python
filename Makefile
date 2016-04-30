.PHONY: clean develop sdist rst

PACKAGE=bemo

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  clean       => to clean clean all automatically generated files"
	@echo "  develop     => to install $(PACKAGE) in 'development mode'"
	@echo "  sdist       => to build $(PACKAGE)"
	@echo "  rst         => to build reStructuredText files for PyPI"

clean:
	find . -name \*.pyc -delete
	find . -name \*__pycache__ -delete
	rm -rf ./dist || true
	rm -rf ./bemo.egg-info || true

develop:
	python setup.py develop

sdist:
	python setup.py sdist

rst:
	pandoc --from=markdown --to=rst --output=README.rst README.md
