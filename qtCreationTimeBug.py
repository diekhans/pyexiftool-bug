#!/usr/bin/env python3
import sys
import logging
import shutil
import subprocess
from exiftool import ExifToolHelper

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)
logger.addHandler(logging.StreamHandler(stream=sys.stderr))

newtags = {'QuickTime:CreationDate': '2023:11:25 13:54:48+0000'}

shutil.copy("IMG_3257.mov", "IMG_3257.pyedit.mov")
with ExifToolHelper() as exift:
    exift.logger = logger
    exift.set_tags("IMG_3257.pyedit.mov", newtags)
