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

The entry point is located in ``kern.c``.

The kernel follows the following:

1. Sets the location of our SWI routine.
2. Increments the stack pointer to accommodate our Kernel State.
3. Initialize the kernel (File ``private_kernel_interface.c``:``k_InitKernel()``).

   1. Save the SP and LR values so the kernel can exit back to RedBoot.
   2. Initialize the pseudo Task Descriptor.
   3. Initialize the queues.
   4. Set the SP and LR value of the pseudo Task Descriptor to the Kernel State
   5. Call the ``asm_KernelExit`` routine to push the values to the register.

4. Jump to KernelTask_Start (File ``tasks.c``)
5. Start our first user task that starts the 4 other generic tasks.


Scheduling
----------

Scheduling occurs for all kernel calls. Before the current task descriptor is swapped out,

1. The user task's SP, LR, and SPSR values are saved into the current task descriptor.
2. Any related values are also saved into the TD.
3. The next task is selected (``schedule_next_task()``).

   1. The current task is set to ``READY``.
   2. A task is removed from the Priority Queue.

      * Any tasks in the ``ZOMBIE`` state are not re-queued. Go back to step 1.

   3. Use the pointer to the task as the next task to be run.
   4. Set the selected task as ``ACTIVE``.
   5. Reschedule the selected task by adding it back to the Priority Queue.

4. If there no more tasks in the Priority Queue, the kernel exits back to RedBoot using the values we saved on the Kernel State.
5. Otherwise, the SP, LR, and return values are saved into the Kernel State.
6. Assembly routine ``asm_KernelExit`` pushes these values to the registers.


User tasks
----------

The tasks are defined in ``tasks.c``.

``KernelTask`` is a pseudo task with a pseudo task descriptor. It is simply used to start the first user task and does not get rescheduled. It has a task id of 0.

The first user task is called ``FirstTask``. It has a task id of 1. The other tasks are called ``GenericTask``.


System Calls
------------

The system calls should be complete in respect to the specifications.

``Create``
    Returns the new task id, ``ERR_K_INVALID_PRIORITY -1``, or ``ERR_K_OUT_OF_TD -2``

``MyTid``
    Returns the current task id

``MyParentTid``
    Returns the parent task id. The parent task id is always returned regardless of the parent's state.

``Pass``
    (Rescheduling happens as normal in the background.)

``Exit``
    Task is marked as ``ZOMBIE`` (and rescheduling happens as normal in the background).


Algorithms and Data structures
++++++++++++++++++++++++++++++


Queue
-----

The queue, a ``struct``, is implemented as a ring buffer. A start and end index is used to point to the start and end of the array. Each item is a ``void*``. The ring buffer allows adding and removing an item from the queue in constant time. A null pointer is returned if the queue is empty.


Priority Queue
--------------

The priority queue consists of 5 queues for 5 levels of priority: highest, high, normal, low, and lowest. ``NORMAL`` is the default priority. Adding and removing an item is constant time.

======== ===
Priority Int
======== ===
HIGHEST   1
HIGH      2
NORMAL    3
LOW       4
LOWEST    5
======== ===

Performance can be improved for removing an item in the priority queue. It currently checks all queues. An additional variable that tracks the highest, non-empty queue could be used.


Task Descriptor (TD)
--------------------

The TD, a ``struct``, holds important information such as the task id, state, and return values.


Kernel State
------------

The Kernel State is a ``struct`` stored at ``0x01500000``. It contains values such as the SP, LR, and return values that are set and retrieved in C code. Once these values are set, a routine is run in assembly code that pushes these values to the appropriate registers. This method makes it convenient for writing in C.

The Kernel State also contains information about the Task Descriptors.


Source Code
===========

The source code is located at ``/u/location/here/files/``.

::

    Listings go here
    Listings go here
    Listings go here


Output
======

The executable prints the following:

1. ``FirstTask``, with ID 1, prints the message about creating two tasks 2 and 3
2. Task 4 executes.

   * Task 4 executes because it is created with ``HIGH`` priority. The ``FirstTask`` has only ``NORMAL`` priority.

3. ``FirstTask`` prints that it created task 4.
4. Task 5 executes.

   * Task 5 has ``HIGH`` priority

5. ``FirstTask`` prints that it created task 5.
6. ``FirstTask`` exits.
7. Task 2 runs.

   * Task 2 has ``LOW`` priority so it runs only now.

8. Task 3 runs.
9. Task 2 runs.

   * Task 2 and 3 have equal priority so they are queued right after each other.
10. Task 3 runs.

