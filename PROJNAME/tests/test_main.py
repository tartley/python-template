from subprocess import PIPE, Popen
from unittest import TestCase

from PROJNAME import __version__


def call_process(command, expected_out=(), expected_err=()):
    process = Popen(command, shell=True, stdout=PIPE, stderr=PIPE)
    out, err = process.communicate()
    out = out.decode('unicode_escape')
    err = err.decode('unicode_escape')
    assert process.returncode == 0, '\n%s\n%s' % (err, out)
    return out, err


class HappyDayTest(TestCase):

    def test_no_args(self):
        out, err = call_process('PROJNAME')
        self.assertEqual(err, '')
        self.assertEqual(out, 'Hello, World.\n')

    def test_help(self):
        out, err = call_process('PROJNAME --help')
        self.assertIn('PROJNAME v{}'.format(__version__), out)
        self.assertIn('Usage:', out)

    def test_version(self):
        out, _ = call_process('PROJNAME --version')
        self.assertIn(__version__, out)

