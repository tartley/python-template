# This Makefile is just a cheatsheet of some commonly used commands.
#
# I've generally been executing these on:
# * Ubuntu,
# * OSX with up-to-date gnu binaries on the PATH,
# * WindowsXP/7 with Cygwin binaries foremost on the PATH.

# virtualenv

ve:
	# Make can't execute 'mkvirtualenv', 'cos we don't use interactive shell.
	# So execute it yourself:
	# mkvirtualenv -p $(which python3.4) -a . -r requirements-dev.txt PROJNAME

download-deps:
	pip install -r requirements.txt --download=deps
	rm deps/PROJNAME-*

popve:
	# For applications:
	#pip install -r requirements.txt --no-index --find-links=deps
	#pip install -r requirements-dev.txt
	# For libraries:
	#pip install -e .
	#pip install -e ".[dev]"

# development

test:
	python -m unittest discover
.PHONY: test

pylint:
	pylint *.py
.PHONY: pylint

tags:
	ctags -R --languages=python .
.PHONY: tags

clean:
	rm -rf build dist MANIFEST tags *.egg-info
	find . -name '*.py[oc]' -exec rm {} \;
.PHONY: clean

develop:
	# create executable entry points in our python or virtualenv's bin dir
	python setup.py develop
.PHONY: develop


# build a distributable

build:
	pyinstaller --name=PROJNAME PROJNAME/__main__.py


# push to PyPI

sdist: clean
	python setup.py sdist --formats=zip,gztar
.PHONY: sdist

register: clean
	python setup.py sdist --formats=zip,gztar register
.PHONY: register

upload: clean
	python setup.py sdist --formats=zip,gztar register upload
.PHONY: upload


# Don't work

# profile:
#   # runsnake is a GUI visualiser for the output of cProfile
#   # http://www.vrplumber.com/programming/runsnakerun/
# 	python -O -m cProfile -o profile.out PROJNAME
# 	runsnake profile.out
# .PHONY: profile

# py2exe:
# 	rm -rf dist/PROJNAME-${RELEASE}.* build
# 	python setup.py --quiet py2exe
# .PHONY: py2exe
