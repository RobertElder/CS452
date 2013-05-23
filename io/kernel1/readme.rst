=========
CS 452 K1
=========


:Names: Robert Elder, Christopher Foo
:ID #: , 20309244
:Userids: relder, chfoo
:Date due: May 27, 2013


Running
=======

The executable is located at ``/u/cs452/tftp/ARM/somewhere/path/here/kern.elf``.

It is executed using the regular commands::

    load -b 0x00218000 -h 10.15.167.4 /u/cs452/tftp/ARM/somewhere/path/here/kern.elf
    go


Description
===========


Kernel
++++++


Algorithms and Data structures
++++++++++++++++++++++++++++++


Queue
-----

The queue, a ``struct``, is implemented as a ring buffer. A start and end index is used to point to the start and end of the array. Each item is a ``void*``. The ring buffer allows adding and removing an item from the queue in constant time. A null pointer is returned if the queue is empty.


Priority Queue
--------------

The priority queue consists of 5 queues for 5 levels of priority: highest, high, normal, low, and lowest. Adding and removing an item is constant time.

Performance can be improved for removing an item in the priority queue. It currently checks all queues. An additional variable that tracks the highest, non-empty queue could be used.


Task Descriptor (TD)
--------------------

The TD, a ``struct``, holds important information such as the task id, state, and return values.


Kernel State
------------

The Kernel State is a ``struct`` stored at ``0x01500000``. It contains values such as the SP, LR, and return values that are set and retrieved in C code. Once these values are set, a routine is run in assembly code that pushes these values to the appropriate registers.

The Kernel State also contains information about the Task Descriptors.


Source Code
===========


Output
======
