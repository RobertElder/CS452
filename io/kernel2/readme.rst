=========
CS 452 K2
=========


:Names: Robert Elder, Christopher Foo
:ID #: 20335246, 20309244
:Userids: relder, chfoo
:Date due: May 31, 2013


Running
=======

The executable is located at ``/u/cs452/tftp/ARM/relder-chfoo/k2-submit/kern.elf``.

It is executed using the regular commands::

    load -b 0x00218000 -h 10.15.167.4 ARM/relder-chfoo/k2-submit/kern.elf
    go


Description
===========


Kernel
++++++


Scheduling
----------

* The blocked states are now used. They corresponds to those explained in the lecture:

  * ``RECEIVE_BLOCKED``
  * ``SEND_BLOCKED``
  * ``REPLY_BLOCKED``

* Tasks that blocked are simply rescheduled by re-queueing it.


System Calls
------------

* Added support for 5th argument.

The system calls are not entirely complete according specifications and are noted below.

``Send``
    The function behaves as expected except the error ``-3`` code is not implemented.

``Receive``
    The function behaves as expected. The size of the message sent would be typically 100 bytes since it is the convention used in the kernel.

``Reply``
    The function behaves as expected except error codes ``-3`` and ``-4`` are not implemented.

``RegisterAs``
    The function behaves as expected. It uses the ``NameServerMessage`` structure and sends the message. ``0`` is always returned because the Task ID is hard-coded and the call should never send to the wrong task.

``WhoIs``
    The function behaves as expected. As noted in ``RegisterAs``, we either return a Task ID or 0.

Name Server
+++++++++++

File: ``nameserver.c``

The name server uses a 2D ``char`` array. The maximum name is limited arbitrary to 100 letters including the null terminator. The array index corresponds to the Task ID for simplicity and constant time operations.

It does the following:

1. ``Receive`` a message casted to ``NameServerMessage``
2. Determine the request type.
3. Look up or set the value in the array.

* Requests to set the name multiple times overwrites the previous value.
* 0 is returned when an invalid Task ID is provided.
* The Task ID is hard-coded to ``2``.


Rock Paper Scissors
+++++++++++++++++++

File: ``rps.h``

There are two server-client structures: ``RPSServer`` and ``RPSClient``. ``RPSMessage`` is the message structure.

The kernel starts the ``RPSServer`` and 3 ``RPSClient``s. All of them are executed at ``NORMAL`` priority as to allow us to catch synchronization bugs. 

RPSServer
---------

1. Registers with the name server
2. ``Receive`` and processes message with sign up, quit, and play types.
3. Outputs if there is only 1 or less items in the sign up queue.

Sign Up
'''''''

1. Add the task ID to the sign up queue.
2. Mark it as signed up on the sign up array.
3. ``Reply`` with a ``SIGN_UP_OK`` type message.

Quit:
'''''

1. Mark it as quit (0) on the sign up array.
2. ``Reply`` with a ``GOODBYE`` type message.

Player Selection
''''''''''''''''

Players are selected by going through the sign up queue. Players are not requeued if they have quit.

Play
''''

1. Get the player's choice by matching the Task IDs
2. Once we have two choices, we can ``Reply`` with the outcome.
3. ``Reply`` a ``NEGATIVE_ACK`` message type if the client cannot play yet.


RPSClient
---------

Each client wants to play 5 times.

1. Look up the task ID of the ``RPSServer``.
2. Sign up
3. Decide their choice and ``Send`` it.
4. If a ``NEGATIVE_ACK`` is received, try again. This is a simple polling method that is robust.

   * This could be improved/avoided by having the ``RPSServer`` notify or ``Send`` to the client to let it know it is ready.

5. Read the message and print out results.
6. Waits for keyboard input



Algorithms and Data structures
++++++++++++++++++++++++++++++


Queue
-----

File: ``queue.c``

A change was made so that it returns the current item count.



Task Descriptor (TD)
--------------------

File: ``task_descriptor.c``

The TD was modified so it contains message pointer such as the address of TID for ``Receive``


Kernel State
------------

File: ``kernel_state.h``

An array of ``KernelMessage`` and its related variables was added to the ``KernelState``


Memory Operations
-----------------

File: ``memory.c``

Functions were added so that strings (potentially binary data) could be copied. They are simple and copy one ``char`` at a time.

Possible improvements: Instructions could be written in assembly that make use of the block copying mode.


Kernel Message
--------------

File: ``message.h``

``KernelMessage`` is a ``struct`` that contains the message string. It contains origin and destination IDs and pointers.


Messages
--------

Messages are ``structs`` that are casted into ``char*``. This casting allows us to manipulate messages more easily with type safety rather than dealing with raw ``char``s. The message size is fixed arbitrary 100 for consistency.


Random Number Generator
-----------------------

File: ``random.h``

A LCG is used as the random number generator. It uses the GCC values as noted on Wikipedia. The seed is multiplied by an arbitrary number to get the generator going.


Assert
------

The assert statement has been enhanced to show Thomas The Tank Engine. Please do not be alarmed when you see it.



Source Code
===========

The source code is located at ``/u4/chfoo/cs452/group/k1-submit/io/kernel-1-submission``. It can be compiled by running ``make``.

Source code MD5 hashes::

    TODO

Elf MD5 hash::

    TODO

Git sha1 hash: ``TODO``


Output
======

The executable prints:

* Task creation
* Who wants to sign up
* What clients choose
* The chosen player task IDs
* The result of the game
* The client's reasoning for winning/losing
* When a client quits

Note that a keyboard response is needed when the *client* gets the result. This allows us to see what the *server* decided before continuing execution. So two presses of the keyboard are needed for each round.


Unimplemented Code
++++++++++++++++++

Because the user tasks are not finished, the program will end up at an assertion failure. The last task remaining will not be able to play because it will continue to poll and wait.

If more time was available, we would have implemented:

* Detect when 1 client is remaining and ``Send`` a ``SHUTDOWN`` message type to the client.
* The client will stop and exit.
* Stop the ``PRSServer`` and the name server
* Exit cleanly.

Performance Measurement
=======================

TODO
