import time
import sys
import subprocess
import argparse

import rich
from rich.pretty import pprint as PP
from rich.console import Console
from rich.table import Table
CONSOLE = Console()


parser = argparse.ArgumentParser(prog="vtypist", description="Typing via virsh made 'easier'. Implementation is incomplete. Default Keyboard Type is 'de'.", epilog="Useful? Donate: https://www.paypal.com/donate/?hosted_button_id=4EZE2QKKG29JE THANK YOU")
parser.add_argument("host", metavar="HOST", type=str, help="HOST for virsh (see 'virsh --list')")
parser.add_argument("filename", metavar="FILENAME", type=str, help="Filename or '-' for STDIN")
parser.add_argument("--de", action="store_true", help="(default) german layout")
parser.add_argument("--en", action="store_true", help="english layout")
parser.add_argument("--do-cad", action="store_true", help="press CTRL-ALT-DELETE (same en/de)")
parser.add_argument("--do-win-cmd", action="store_true", help="assume windows - start a shell")


args = parser.parse_args()


dom = args.host
srcfile = args.filename
src=None

#KEY_LEFTCTRL KEY_ESC
#KEY_LEFTCTRL KEY_LEFTALT KEY_DELETE

# translation table
tt = {}

tt['\n'] = 'KEY_ENTER'
tt['.'] = 'KEY_DOT'
tt[':'] = 'KEY_LEFTSHIFT KEY_DOT'
tt['/'] = 'KEY_LEFTSHIFT KEY_7'
tt['}'] = 'KEY_RIGHTALT KEY_0'
tt['-'] = 'KEY_SLASH'
tt['\\'] = 'KEY_RIGHTALT KEY_MINUS'
tt[' '] = 'KEY_SPACE'
tt['ß'] = 'KEY_MINUS'
tt['"'] = 'KEY_LEFTSHIFT KEY_2'
tt['?'] = 'KEY_LEFTSHIFT KEY_MINUS'
tt['ä'] = 'KEY_APOSTROPHE'
tt['Ä'] = 'KEY_LEFTSHIFT KEY_APOSTROPHE'
tt['ö'] = 'KEY_SEMICOLON'
tt['Ö'] = 'KEY_LEFTSHIFT KEY_SEMICOLON'
tt[';'] = 'KEY_LEFTSHIFT KEY_COMMA'
tt['='] = 'KEY_LEFTSHIFT KEY_0'

for c in '0123456789':
    tt[c] = 'KEY_%s' % c

for c in 'abcdefghijklmnopqrstuvwxyz':
    tt[c] = 'KEY_%s' % c.upper()

for c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ':
    tt[c] = 'KEY_LEFTSHIFT KEY_%s' % c.upper()

tt['y'] = 'KEY_Z'
tt['Y'] = 'KEY_LEFTSHIFT KEY_Z'

if srcfile == "-":
    src = sys.stdin.read()
else:
    with open(srcfile, 'r') as f:
        src = f.read().replace("\r", "")


def run_v(h, param):
    cmd = """virsh send-key %s %s""" % (h, param)
    print(cmd)
    subprocess.call(cmd, shell=True)


def run_v_tt(h, src):
    global tt
    for c in src:
        if c in tt:
            run_v(h, tt[c])


if args.do_win_cmd:
    run_v(args.host, "KEY_LEFTCTRL KEY_ESC")
    time.sleep(2)
    run_v_tt(args.host, "cmd.exe\n")
    sys.exit(0)


run_v_tt(dom, src)
