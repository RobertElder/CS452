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

The entry point is located at **``0x0004500``** or ``%{FREEMEMLO}`` It is executed using the regular commands::

    load -b 0x0004500 -h 10.15.167.4 ARM/relder-chfoo/k3-submit/kern.elf
    go


Description
===========

Kernel
++++++

System Calls
------------

``AwaitEvent``
    Marks the task as ``EVENT_BLOCKED``.

``Time``
    Wraps a ``Send`` to the ``ClockServer``

``Delay``
    Calls ``DelayUntil(Time() + ticks)``. Ticks are converted to absolute time. Calling ``Time`` is not optimal and the next version will differentiate relative and absolute time on the ``ClockServer`` to save some clock cycles.

``DelayUntil``
    Wraps a ``Send`` to the ``ClockServer``

``TimeSeconds``, ``DelaySeconds``, ``DelayUntilSeconds``
    Same as above but in seconds. It simply converts the ticks into seconds before calling the system calls. These calls are simply for convenience.


* The SWI vector entry code has been fixed by setting it to the correct location.

Memory model
------------

The memory model is now changed to look like this::

    ascii diagram


TODO: explain why the entry point moved


Message Passing
---------------

TODO: what changed


Clock Server
++++++++++++

File: ``clock.c``

The Clock Server runs in a loop receiving messages from the Clock Notifier or user tasks via the Public Kernel Interface wrappers. Whenever it receives a Event Notification from the Clock Notifier, it increments its counter. The counter is the number of ticks since the Clock Server start up.

Data Structures
---------------

The Clock Server maintains a array mapping of TIDs to clock ticks in absolute time. Accesses to this mapping are constant time.


Delay Requests
--------------

Whenever the Clock Server receives a delay request message, it checks whether the time is past in time. If so, it immediately replies back. Otherwise, it stores the requested time into the array mapping of TIDs to ticks.


Unblocking
----------

After handling each received message, the Clock Server will check the array mapping for ticks that are in the past. If so, it will reply back. This search is linear. TODO: explain whether this is acceptable.


Interrupt Handler
+++++++++++++++++

File: ``kernel_irq.c``

Timer3 is enabled and counts down from 5080 to give 10ms interrupt intervals. The kernel also sets the CPSR to allow interrupts.

The interrupt handler will call the scheduler to unblock tasks and acknowledge Timer3.

The interrupt handler currently assumes that it is the Timer3 interrupt since no other interrupts are enabled. The next kernel will check for the correct interrupt source.


Scheduler
+++++++++

File: ``scheduler.c``

* Scheduler code is now in its own file.
* Number of tasks in each event states are now tracked for debugging purposes.
* 32 levels of priority has been implemented.
* Blocked tasks are not requeued in the ready queue until it is actually ready.

The Scheduler has an array mapping of ``EventID`` to boolean. This array tracks whether at least one task is waiting on an event.


Event Unblocking
----------------

When the Scheduler is asked to unblock events on a particular ``EventID``, it firsts checks the ``EventID`` array mapping. If it is true, then it continues.

The Scheduler will use linear search to find tasks that are ``EVENT_BLOCKED`` and change its state to ``READY``. TODO: Explain why linear search is ok.


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


Memory Allocation
-----------------

TODO


RPS
+++

The ``RPSServer`` has been refactored to fix synchronization problems. It is used for stress testing the OS. At least 300 tasks should run without problems.


Nameserver
++++++++++

Maximum name length has been arbitrary reduced to 40 chars to save some memory space.


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


