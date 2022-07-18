# Python project template

This template is good for Python applications or libraries.

For a library, you could delete the __main__.py module, and the corresponding
entry_point in setup.py.

## Usage

Make a copy of the 'template' directory, then run:

    search-and-replace.sh PROJNAME <projname>

where:
    PROJNAME is the literal string "PROJNAME" (without quotes)
    <projname> is the name of your new project

## To do

Consider creating pyproject.toml, setup.cfg, & reducing setup.py to a shim.
https://snarky.ca/what-the-heck-is-pyproject-toml/
UPDATE: I believe setup.py can now be removed completely
Consider the replacements for each 'setup.py X' target detailed here:
https://blog.ganssle.io/articles/2021/10/setup-py-deprecated.html#summary

Donate link in README. Can I just make up an `item_name`? (ie use PROJNAME)

package upload test, get from colorama makefile target
    along with the $(version) trick

README sections in order taken from colorama / cbeams
Including the README-hacking.md, especially release checklist.

Self-documenting makefile

Should parts of Makefile be hoisted into a more general Makefile template?
Should the python makefile include the general one? Or generate this at
project creation time?

Makefile
working virtualenv creation
generating requirements.txt from setup.py
build wheel
test a release
make a release (do what colorama does, but also tag and push)
    Check the tag does not already exist
    Exit on error during upload (unlike test-release)
create an executable, using pyinstaller? A test that it works?

Run tests with Python in warning mode.

Use tox to run against different python versions, including 3.9 and 3.10
    - "make test" runs against current python
    - "make tox" runs same lint & tests against python matrix?

Online CI that runs "make tox"

replace docopts with argparse

put source in 'src' directory
(search-and-replace no longer needs to print the PROJNAME directory)
tests run against that

Consider moving config from setup.py to setup.cfg. This addresses the
README duplication issue below.

Can we eliminate the duplication between the README, and the top level package
docstring, (which is output by pydoc and '--help'). Perhaps README should be
generated from the docstring at build/release time? Simpler would be to make
the README very minimal, and direct people to running the tool with -h. But
that is at odds with putting docs online. Maybe generation of one from the
other is inevitable then?

