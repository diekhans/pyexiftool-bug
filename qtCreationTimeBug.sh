#!/bin/bash -ex

exiftool -QuickTime:CreationDate IMG_3257.mov >before.meta

rm -f IMG_3257.cmdedit.mov
exiftool -QuickTime:CreationDate='2023:11:25T13:54:48+0000' -o IMG_3257.cmdedit.mov IMG_3257.mov

exiftool -QuickTime:CreationDate IMG_3257.cmdedit.mov >cmdedit.meta

cp -f IMG_3257.mov IMG_3257.subedit.mov
exiftool -@ /dev/stdin << EOF
-ver
-echo4
=${status}=post890913
-execute890913
-QuickTime:CreationDate=2023:11:25 13:54:48+0000
IMG_3257.subedit.mov
-echo4
=${status}=post972111
-execute972111
EOF

exiftool -QuickTime:CreationDate IMG_3257.subedit.mov >subedit.meta
