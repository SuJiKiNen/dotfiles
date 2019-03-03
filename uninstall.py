#!/usr/bin/env python
"""
Uninstall script.
Shamelessly copied from:
https://github.com/anishathalye/dotbot/issues/152#issuecomment-394129600
"""
from __future__ import print_function

import os
import sys

CURDIR=os.getcwd()
YMAL_PATH=os.path.join(
    CURDIR,
    "dotbot",
    "lib",
    "pyyaml",
    "lib3" if sys.version_info[0]>=3 else "lib",
)
sys.path.append(YMAL_PATH)

import yaml  # isort:skip
CONFIG="install.conf.yaml"
stream = open(CONFIG, "r")
conf = yaml.load(stream)

for section in conf:
    if 'link' in section:
        for target in section['link']:
            realpath = os.path.expanduser(target)
            if os.path.islink(realpath):
                print("Removing ", realpath)
                os.unlink(realpath)
