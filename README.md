# pyexiftool-bug

DELETE THIS REPO  error was causes by weird timzone offset

This demonstrates a problem with pyexiftool calling exiftool
to set QuickTime:CreationDate with a timezone.

When called from the command line (qtCreationTimeBug.sh) it works as expected.
When called from pyexiftool (./qtCreationTimeBug.py, it causes exiftool to
generate an error.

     ./qtCreationTimeBug.py 
    Method 'execute': Command sent = [b'-QuickTime:CreationDate=2023:11:25 13:54:48+0000', b'IMG_3257.pyedit.mov', b'-echo4', b'=${status}=post666749']
    ExifToolHelper.execute: IN  params = ('-QuickTime:CreationDate=2023:11:25 13:54:48+0000', 'IMG_3257.pyedit.mov')
    ExifToolHelper.execute: OUT stdout = ""
    ExifToolHelper.execute: OUT stderr = "Warning: Use of uninitialized value $val in substitution (s///) in Keys:CreationDate (ValueConvInv)
    Nothing to do.
    "
    ExifToolHelper.execute: OUT status = 1
    Method 'terminate': Exiftool terminated successfully.
    Traceback (most recent call last):
      File "/Users/markd/photo/digital/photo-util/bug/pyexiftool-bug/./qtCreationTimeBug.py", line 17, in <module>
        exift.set_tags("IMG_3257.pyedit.mov", newtags)
      File "/Users/markd/photo/digital/photo-util/bug/pyexiftool/exiftool/helper.py", line 484, in set_tags
        return self.execute(*exec_params)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/Users/markd/photo/digital/photo-util/bug/pyexiftool/exiftool/helper.py", line 135, in execute
        raise ExifToolExecuteError(self._last_status, self._last_stdout, self._last_stderr, str_bytes_params)
    exiftool.exceptions.ExifToolExecuteError: execute returned a non-zero exit status: 1
