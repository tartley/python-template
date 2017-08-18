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

Figure the convention for using *requirements-direct.txt* (or somesuch)
to generate *requirements.txt*. Same for requirements-dev, presumably.
And doesn't Kenneth R have, or recommend, a tool to do it?

Can we eliminate the duplication between the README, and the top level package
docstring, (which is output by pydoc and '--help'). Perhaps README should be
generated from the docstring at build/release time? Simpler would be to make
the README very minimal, and direct people to running the tool with -h. But
that is at odds with putting docs online. Maybe generation of one from the
other is inevitable then?

Add a test for creating an executable using pyinstaller? Perhaps the existing
test_main.py could create and use this executable instead of calling main()
in-process?

--version should also output the Python version, whether it's running
frozen or not, whether optimisation is on, whether __debug__ is on.

This template should include an packageable, installable, runnable placeholder
app. Even if it's just a terminal doodler.

