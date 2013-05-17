CS 452 A0
=========

:Name: Christopher Foo
:ID #: 20309244
:userid: chfoo
:Date due: May 13 2013



.. raw:: latex
  
      \newpage 


Description
===========

Running
+++++++

The program can be run with the standard command::

    load -b 0x00218000 -h 10.15.167.4 "ARM/chfoo/submit/a0/a0.elf
    go

The executable is saved at ``/u/cs452/tftp/ARM/chfoo/submit/a0/a0.elf``

The program will show the timer in minutes, seconds, and milliseconds in the top-left corner of the screen. Other features not implemented.

Program Structure
+++++++++++++++++

Data structure
--------------

Bytes to be sent or received are stored as a char array as part of struct called Buffer. It works as a queue with indexes pointing at the start and ends of the array. The indexes are reset to 0 once the buffer is empty. 


Main loop
---------

During each iteration:

1. It checks if the timer has underflowed. The timer is configured to tick down from 200 at 2kHz for initial testing. This configuration gives 0.1 seconds.
2. If the timer has passed, it outputs the time.
3. Attempts to send one byte per output buffer.
4. A debug block has been left that will output an X onto the screen every 100000 iterations.


Notes/bugs
----------

* If the buffer does not have chance to reset, it will ignore new bytes due to incomplete implementation.
* The timer is slow.
* The rest of the program is unfinished.


MD5 Hashes and Files
====================

The assignment can be found at ``/u4/chfoo/cs452/submit/a0/``::

    chfoo@linux032:~$ pwd
    /u4/chfoo

    chfoo@linux032:~$ ls -hal cs452/submit/a0/
    total 28K
    drwxr-x--x 2 chfoo chfoo 4.0K 2013-05-12 22:40 .
    drwxr-x--x 3 chfoo chfoo 4.0K 2013-05-12 22:33 ..
    -rw-r----- 1 chfoo chfoo 6.1K 2013-05-12 22:35 a0.c
    -rw-r----- 1 chfoo chfoo  636 2013-05-12 22:35 Makefile
    -rw-r----- 1 chfoo chfoo  390 2013-05-12 22:35 orex.ld
    -rw-r----- 1 chfoo chfoo 2.4K 2013-05-12 22:35 ts7200.h

    chfoo@linux032:~$ md5sum cs452/submit/a0/*
    6bbd6f77dea06a6203edeb17c4af3c67  cs452/submit/a0/a0.c
    e455b34df000ac47046321404764361b  cs452/submit/a0/Makefile
    9bcd562566ba01c869c8c2759ff90e64  cs452/submit/a0/orex.ld
    9af226f127c1fd759530cd45236c37b8  cs452/submit/a0/ts7200.h

    chfoo@linux032:~$ ls -hal /u/cs452/tftp/ARM/chfoo/submit/a0/
    total 20K
    drwxr-x--x 2 chfoo chfoo 4.0K 2013-05-12 22:40 .
    drwxr-x--x 3 chfoo chfoo 4.0K 2013-05-12 22:37 ..
    -rwxr-xr-x 1 chfoo chfoo 8.4K 2013-05-12 22:40 a0.elf

    chfoo@linux032:~$ md5sum /u/cs452/tftp/ARM/chfoo/submit/a0/*
    b0a4c562fcbc69df0cc3e2f1c08c8242  
         /u/cs452/tftp/ARM/chfoo/submit/a0/a0.elf


Answers to questions
====================

1. Not finished.
2. Not finished.

