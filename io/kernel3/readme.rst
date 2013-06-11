=========
CS 452 K3
=========


:Names: Robert Elder, Christopher Foo
:ID #: 20335246, 20309244
:Userids: relder, chfoo
:Date due: June 12, 2013


Running
=======

The executable is located at ``/u/cs452/tftp/ARM/relder-chfoo/k3-submit/kern.elf``.

The entry point is located at **``0x00045000``** or ``%{FREEMEMLO}`` It can be executed with caching enabled::

    load -b %{FREEMEMLO} -h 10.15.167.4 ARM/relder-chfoo/k3-submit/kern.elf
    go -c


Description
===========

Kernel
++++++

* The SWI vector entry code has been fixed by setting it to the correct location.
* Caching improves the performance of the program and Clock Slow Warnings should only  appear on task creation and shutdown. We recognize that without caching more warnings may be printed. See Performance.
* User state is still pushed into the wrong stack space. It is still being rewritten.


System Calls
------------

``AwaitEvent``
    Marks the task as ``EVENT_BLOCKED``. The task will be unblocked by the Scheduler via the timer interrupt.

``Time``
    Wraps a ``Send`` to the Clock Server. It first queries the Name Server for the Clock Server and then sends a ``TIME_REQUEST`` message. It expects back a ``TIME_REPLY`` message and returns the time.

``Delay``
    Similar to ``Time``, it sends a ``DELAY_REQUEST`` message and expects back a ``DELAY_REPLY`` message.

``DelayUntil``
    Similar to ``Time``, it sends a ``DELAY_UNTIL_REQUEST`` message and expects back a ``DELAY_REPLY`` message.

``TimeSeconds``, ``DelaySeconds``, ``DelayUntilSeconds``
    Same as above but in seconds. It simply converts the ticks into seconds before calling the system calls. These calls are simply for convenience.



Memory model
------------

The memory model is now changed to look like this::

    +---------------+ 0x0020_0000
    | RedBoot Stack |
    +---------------+ 0x01fd_cf80 (typical)
    | Kernel Stack  |
    +---------------+ 0x01ea_cf04
    | IRQ Stack     |
    +---------------+ 0x01e2_cf04
    | User Stack    |
    |               |
    +---------------+ 0x0005_2804 (_EndOfProgram specified in orex.ld)
    | Kernel        |
    +---------------+ 0x0004_5000 (%{FREEMEMLO} RedBoot alias)
    | RedBoot       |
    +---------------+ 0x0000_0000


After consulting the RedBoot documentation, the entry point was moved to ``0x00045000`` to free up more memory for user stacks. We believe that this new memory location is not used and we have not found any reason we cannot move the entry point to this location.

As well, we are able to have assert checks on stack boundaries. Using ``_EndOfProgram``, we can check if a user stack pointer overwrites the kernel. There are checks for each user stack as well.

Stack values can be adjusted if needed.


Message Passing
---------------

Kernel Messages, messages that are copied into the kernel, are now stored into an array, using Dynamic Memory Allocation (see below), instead of using a combination of ring buffers and queues. Refactoring to a simpler solution allows us to reduce the load on our brain while debugging the kernel. See Dynamic Memory Allocation for more information.

The maximum message size is now 16 bytes. This was done to reduce the time spent on message copying.


Clock Server
++++++++++++

File: ``clock.c``

The Clock Server runs in a loop receiving messages from the Clock Notifier or user tasks via the Public Kernel Interface wrappers. Whenever it receives a Event Notification from the Clock Notifier, it increments its tick counter. The tick size is defined to be 10ms.


Data Structures
---------------

The Clock Server maintains a array mapping of TIDs to clock ticks in absolute time. Accesses to this mapping are constant time.


Delay Requests
--------------

Whenever the Clock Server receives a delay request message, it checks whether the time is past in time. If so, it immediately replies back. Otherwise, it stores the requested time into the array mapping of TIDs to ticks.


Unblocking
----------

After handling each received message, the Clock Server will check the array mapping of TID to delay time for ticks that are in the past. If so, it will reply back. This search is linear. See Performance.


Clock Slow Warning
------------------

Timer4 was enabled to use for debugging the performance of the kernel. The Clock Server uses this debug timer to time how long it takes for it to receive a notification from the Clock Notifier. It will print out a red warning message if the time is longer than the tick time (10ms) by 1ms. 


Interrupt Handler
+++++++++++++++++

File: ``kernel_irq.c``

Timer3 is enabled and counts down from 5080 to give 10ms interrupt intervals. The kernel also sets the CPSR to allow interrupts.

The interrupt handler will call the scheduler to unblock tasks and it also acknowledge Timer3.

The interrupt handler currently assumes that it is the Timer3 interrupt since no other interrupts are enabled. The next deliverable will check for the correct interrupt source.


Scheduler
+++++++++

File: ``scheduler.c``

Changes:

* Scheduler code is now in its own file.
* Number of tasks in each event states are now tracked for debugging purposes.
* 32 levels of priority has been implemented.
* Blocked tasks are not requeued in the ready queue until it is actually ready.

The Scheduler has an array mapping of ``EventID`` to boolean. This array tracks whether at least one task is waiting on an event.


Event Unblocking
----------------

When the Scheduler is asked to unblock events on a particular ``EventID``, it firsts checks the ``EventID`` array mapping. If it is true, then it continues.

The Scheduler will use linear search to find tasks that are ``EVENT_BLOCKED`` and change its state to ``READY``. See Performance.


Priority Levels
---------------

Named priority levels have been maintained for backwards compatibility.


======== ===
Priority Int
======== ===
HIGHEST   0
HIGH      8
NORMAL    16
LOW       24
LOWEST    31
======== ===


Queue
+++++

File: ``queue.c``

The ``PriorityQueue`` now uses an integer to track which priority level has items. When a bit is 1, it means there is at least one item in the queue. For example, ``00110000...`` means there is at least one item in priority 2 and 3 queues. The count leading zero instruction is used so that we no longer need check all 32 queues when getting an item.


Memory
++++++

File: ``memory.c``

``m_strcpy`` has optimization improvements. It now can copy strings at 1, 8, or 64 octets at a time using block load and store instructions.


Dynamic Memory Allocation
-------------------------

A simple, but linear time, Dynamic Memory Allocation was implemented. It is currently used for storing Kernel Messages.

It uses an array of booleans to track which blocks of memory have been allocated. The blocks of memory are implemented as a ``char`` array.

To allocate memory, it searches the array of booleans for a free spot and returns a pointer. Freeing memory simply requires calculating the index of array of boolean and setting it to 0.

See Performance.


RPS
+++

The ``RPSServer`` has been refactored to fix synchronization problems. It is used for stress testing the OS. At least 300 tasks should run without problems.


Nameserver
++++++++++

Maximum name length has been arbitrary reduced to 8 bytes (including the null terminator) to fit within the reduced size Kernel Message.

IdleTask and AdministratorTask
++++++++++++++++++++++++++++++

The Administrator Task is responsible for helping us exiting to RedBoot.

The Idle Task runs when all tasks are blocked. The Administrator Task keeps track the number of tasks running. The Clock Clients will tell the Administrator Task when it has shutdown. After all tasks have exited, the Administrator Task will tell the Idle Task to exit.


Performance
+++++++++++

For this deliverable, we have found the performance of the kernel to be acceptable after all tasks have been created. Acceptable is defined when the Clock Server does not lose more than 1ms from the Clock Notifier. We have kept linear solutions for now, because we believe that lost ticks during start up and shutdown is not important as the system is not doing anything useful during that time. However, we are still working on improving the overall context switching of the kernel.


Source Code
===========

The source code is located at ``/u4/chfoo/cs452/group/k3-submit/io/kernel3``. It can be compiled by running ``make``.

Source code MD5 hashes::

    Listings go here
    Listings go here



Elf MD5 hash::

    TODO


Git sha1 hash: ``TODO``


Output
======


