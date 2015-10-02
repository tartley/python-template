# Python project template

This template is good for Python applications or libraries.

For a library, you could concievably delete the __main__.py module,
and the corresponding entry_point in setup.py.

## Usage

Make a copy of the 'template' directory, then run:

    search-and-replace.sh PROJNAME <projname>

where:
    PROJNAME is the literal string "PROJNAME" (without quotes)
    <projname> is the name of your new project

## To do

Can we eliminate the duplication between the README, and the top level package
docstring, (which is output by pydoc and '--help'). Perhaps README should be
generated from the docstring at build/release time?

Add a test for creating an executable using pyinstaller? Perhaps the existing
test_main.py could create and use this executable instead of calling main()
in-process?

--version should also output the Python version, whether it's running
frozen or not, whether doctrings are optimised away, whether __debug__ is on.

Use it to create a standalone 'flash' program that doodles on the terminal
until a key is pressed.

