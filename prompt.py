#!/usr/bin/env python3

import subprocess
import os
import sys
import re
bg = 0

def test_virtualenv():
    if 'VIRTUAL_ENV' in os.environ:
        return cl(29,0)+' ⛶ '+os.environ['VIRTUAL_ENV']+" "
    else:
        return ''

def cl(bg2, ch=None, fg=255):
    global bg
    bg1 = bg
    bg = bg2
    if (ch == 1):
        sep=''
    if (ch == 2):
        sep='▞'
    if bg2 == -1:
        if ch:
            ch='\033[0m\033[38;5;{};48;5;{}m{}'.format(bg1, 0, sep)
        else:
            ch=''
        return '\033[0m{}\033[0m'.format(ch)
    else:
        if ch:
            ch='\033[0m\033[38;5;{};48;5;{}m{}'.format(bg1, bg2, sep)
        else:
            ch=''
        return '{}\033[0m\033[38;5;{};48;5;{}m'.format(ch, fg, bg2)

def error():
    if int(sys.argv[2]) != 0:
        return cl(160,0)+' ✋ '+str(int(sys.argv[2])-128)+' '+cl(160,2)
    else:
        return ""

def git():
    try:
        r = subprocess.check_output(['git','status'], stderr=subprocess.PIPE, shell = False)
    except subprocess.CalledProcessError:
        return ''
    stdout = r.decode('utf-8')
    branch = re.search(r'On branch ([^\s]+)',stdout).group(1)
    fg = 255
    sep = '✔'
    if re.search(r'Changes to be committed',stdout):
        fg = 196
        sep = '✗'
    return cl(57 ,0,fg=fg)+' '+sep+' '+branch+' '+cl(29,2);

ansi_escape = re.compile(r'''
    \x1B  # ESC
    (?:   # 7-bit C1 Fe (except CSI)
        [@-Z\\-_]
    |     # or [ for CSI, followed by a control sequence
        \[
        [0-?]*  # Parameter bytes
        [ -/]*  # Intermediate bytes
        [@-~]   # Final byte
    )
''', re.VERBOSE)

# result = ansi_escape.sub('', out)

nbcols=sys.argv[1]
error = error()
right=error+git()+test_virtualenv()
right_len=len(ansi_escape.sub('', right))
if len(error):
    right_len += 1

print(" "*(int(nbcols)-right_len)+right,end = '',flush=True)
subprocess.run(['tput', 'cub', str(nbcols)])
start = cl(33)+' \A '
if os.environ.get('ENV'):
    start = cl(238,fg=208)+"⏵ "+os.environ.get('ENV')+" "
if os.environ.get('USER') == 'root':
    user = cl(160,1,fg=255)+' root '
else:
    user = cl(31,1,fg=255)+' \\u@\\H '
print(start + user + cl(238,1,fg=255)+' \\w '+cl(-1,1))
print("$ ")
