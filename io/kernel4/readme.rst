=========
CS 452 K4
=========


:Names: Robert Elder, Christopher Foo
:ID #: 20335246, 20309244
:Userids: relder, chfoo
:Date due: June 24, 2013


Running
=======

The executable is located at ``/u/cs452/tftp/ARM/relder-chfoo/k4-submit/kern.elf``.

The entry point is located at **``0x00045000``** or ``%{FREEMEMLO}`` It must be executed with caching enabled::

    load -b %{FREEMEMLO} -h 10.15.167.4 ARM/relder-chfoo/k4-submit/kern.elf
    go -c


Commands
++++++++

tr TRAIN SPEED
    Set the train speed.

rv TRAIN
    Slows, stops, and reverses train. The final speed is hard coded to 5.

sw SWITCH DIRECTION
    Changes the turnout direction. DIRECTION is either S or C.

q
    Quits the program.



Description
===========

Kernel
++++++

* Caching improves the performance of the program and will be mandatory for this deliverable.  Due to some issues with timing that we will be addressing soon, some of the important user tasks will deadlock if you do not run the program with caches.  The root cause of this problem is related to improperly attempting to send bytes to the train when the FIFO buffer is empty instead of waiting for CTS to be driven low, then high.


System Calls
------------

* System calls support up to 5 arguments.


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

``Send``
    Sends a message to the given task ID. ``-3`` code is not implemented.

``Receive``
    Blocks until a message is received. Returns the size of the message which will be typically ``MESSAGE_SIZE 16``

``Reply``
    Replies a message to the task. On errors ``-3`` ``-4``, an assert will fire before returning to aid in debugging.

``RegisterAs``
   Prepares a ``NameServerMessage`` structure with a message type of ``REGISTER_AS`` and sends the message to the Name Server. ``0`` is always returned because the Task ID is hard-coded and the call should never send to the wrong task.

``WhoIs``
    Prepares a ``WHO_IS`` message type and sends it to the Name Server. As noted in ``RegisterAs``, we either return a Task ID or 0 if the task has not been created. However, the task ID returned may be in a zombie state.

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

The memory model looks like this::

    +----------------+ 0x0200_0000
    | RedBoot Stack  |
    +----------------+ 0x01fd_cfdc Starting value of redboot stack 
    | Redboot Buffer*|             after box reset
    +----------------+ 0x01FD_B09C 
    | Kernel Stack   |
    +----------------+ 0x01FD_B09C - sizeof(KernelState) - 400kb 
    | IRQ Stack      |             = KernelEnd
    +----------------+ KernelEnd - 500kb
    | User Stacks    |
    |                |
    +----------------+ 0x0005_2804 (_EndOfProgram specified in orex.ld)
    | Kernel         |
    +----------------+ 0x0004_5000 (%{FREEMEMLO} RedBoot alias)
    | RedBoot        |
    +----------------+ 0x0000_0000


Entry
-----

The entry point is located in ``kern.c``.

The kernel follows the following:

1. Sets the location of our SWI and interrupt routines.
2. Sets the location of our stacks.
3. Initialize the kernel (File ``private_kernel_interface.c``:``k_InitKernel()``).

   1. Save the SP and LR values so the kernel can exit back to RedBoot.
   2. Initialize the pseudo Task Descriptor.
   3. Initialize the queues.
   4. Set the SP and LR value of the pseudo Task Descriptor to the Kernel State
   5. Call the ``asm_KernelExit`` routine to push the values to the register.

4. Jump to KernelTask_Start (File ``tasks.c``)
5. Start our first user task that starts the 4 other generic tasks.


Redboot Buffer
--------------

After investigating some problems related to observing program crashes on the second and third execution of the 'go' command, it was discovered that redboot does not properly clean up its stack each time you run a program.  Each time someone runs a program on a board, redboot pushes 80 bytes onto its stack and never removes it, unless you reset the board.  This means that if no one ever reset the board, eventually the redboot stack will crawl through all of memory, and overwrite the user's kernel.  It looks like no one else ever encountered this because they don't any data near the redboot stack like we do.

To prove that this is the case, you can create a simple program as follows::

    int main(){
        asm (
            "LDR r1, [PC, #0]\n" // Load r1 with a memory address we can save the sp into 
            "ADD PC, PC, #0\n" // Jump over the address 
            ".4byte 0x01000000\n" // SP gets saved here every time the program executes 
            "STR SP, [r1, #0]\n" // Save the stack pointer, then do dump -b 0x01000000 -l 4, values increases by 0x50 each time until reset.
        );

        return 0;
    }

Each time you run this program, you will observe that the saved stack value decreases by 0x50.  I attempted to account for this on the exit of my main method, by creating a modified exit routine in assembly that pops the extra information off the stack, but this does not seem to matter.

``${FREEMEMLO}``
----------------

After consulting the RedBoot documentation, the entry point was moved to ``0x00045000`` to free up more memory for user stacks. We believe that this new memory location marks the start of safe memory that is not used as a guarantee from redboot and we have not found any reason we cannot move the entry point to this location.  This values comes from the a redboot alias %{FREEMEMLO} that can be used when loading the program instead of the literal address.

As well, we are able to have assert checks on stack boundaries. Using the ``_EndOfProgram`` linker symbol, we can check if a user stack pointer overwrites the kernel. There are checks for each user stack as well.

Stack values and sizes are configurable, and will generally give appropriate assertions if the memory model has conflicts that can cause corruption.


Message Passing
---------------

Messages are ``structs`` that are casted into ``char*``. This casting allows us to manipulate messages more easily with type safety rather than dealing with raw ``char``. Note we use GCC attribute syntax to word align the character array as the GCC compiler does not realize we are type punning.

Kernel Messages, messages that are copied into the kernel, are now stored into an array, using Dynamic Memory Allocation (see below), instead of using a combination of ring buffers and queues. Refactoring to a simpler solution allows us to reduce the load on our brain while debugging the kernel. See Dynamic Memory Allocation for more information.

The message size is fixed to 16 bytes. Using a fixed value allows for consistency. As well, this low value is meant to reduce the time spent on message copying.


Task Descriptor (TD)
++++++++++++++++++++

File: ``task_descriptor.c``

The TD, a ``struct``, holds important information such as the task id, state, and return values.


Queues
++++++

File: ``queue.c``

The queue, a ``struct``, is implemented as a ring buffer. A start and end index is used to point to the start and end of the array. Each item is a ``void*``. The ring buffer allows adding and removing an item from the queue in constant time. A null pointer is returned if the queue is empty.

Priority Queue
--------------

The Priority Queue uses 32 levels of priority.

Named priority levels are available. Note the highest priority is 0 and the lowest priority is 31.

======== ===
Priority Int
======== ===
HIGHEST   0
HIGH      8
NORMAL    16
LOW       24
LOWEST    31
======== ===


When retrieving an item, the Priority Queue uses an integer to track which priority level has items. When a bit is 1, it means there is at least one item in the queue. For example, ``00110000...`` means there is at least one item in priority 2 and 3 queues. The count leading zero instruction is used so that we avoid checking all 32 queues when getting an item. ``0`` is returned when there is no item.


Char Buffer
-----------

The Char Buffer is a queue of characters. Like Queue, it is implemented as a ring buffer. However, the Char Buffer requires checking whether the Char Buffer is empty before getting an item. It is necessary because a return value of 0 indicates a byte value of 0.


IdleTask and AdministratorTask
++++++++++++++++++++++++++++++

The Administrator Task is responsible for helping us exiting to RedBoot.

The Idle Task runs when all tasks are blocked. The Administrator Task keeps track the number of tasks running. The Clock Clients will tell the Administrator Task when it has shutdown. After all tasks have exited, the Administrator Task will tell the Idle Task to exit.


Name Server
+++++++++++

File: ``nameserver.c``

The name server uses a 2D ``char`` array. The maximum name is limited arbitrary to 8 letters including the null terminator. The small value reduces message copying and string comparison time. The array index corresponds to the Task ID for simplicity and constant time operations.

It does the following:

1. ``Receive`` a message casted to ``NameServerMessage``
2. Determine the request type.
3. Look up or set the value in the array.
4. If it receives a ``NAME_SERVER_SHUTDOWN`` message type, it will ``Exit()``

* Requests to set the name multiple times overwrites the previous value.
* 0 is returned when an invalid Task ID is provided.
* The Task ID is hard-coded to ``2``.
* Look ups are linear time but bounded to the maximum name size of 8.
* Setting names are constant time.


Clock Server
++++++++++++

File: ``clock.c``

The Clock Server runs in a loop receiving messages from the Clock Notifier or user tasks via the Public Kernel Interface wrappers. Whenever it receives a Event Notification from the Clock Notifier, it increments its tick counter. The tick size is defined to be 10ms.


Clock Notifier
--------------

File: ``notifier.c``

The Clock Notifier runs in a loop:

1. Call ``AwaitEvent``
2. Send a ``NOTIFIER`` message with ``CLOCK_TICK_EVENT`` id to the Clock Server.
3. Go to 1.


Data Structures
---------------

The Clock Server maintains a array mapping of TIDs to clock ticks in absolute time. Accesses to this mapping are constant time.

After reviewing feedback from the previous deliverable, we have refactored the memory heap to work in constant time for both requesting and releasing memory.  The use of the heap is further justfied since it is only used when queuing messages inside the kernel.  Constant time allocation and de-allocation is accomplished by use of a stack.  The stack is initialized to contain pointers to all memory blocks that are free.  A request for memory pops a pointer from the top of the stack, and de-allocation pushes the released pointer onto the stack.  This allows constant time random-access de-allocation, while maintaining constant time allocation.

Delay Requests
--------------

Whenever the Clock Server receives a delay request message, it checks whether the time is past in time. If so, it immediately replies back. Otherwise, it stores the requested time into the array mapping of TIDs to ticks.


Unblocking
----------

Unblocking tasks on events has been improved to work in constant time.  See performance.

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


Memory
++++++

File: ``memory.c``


* ``m_strcpy`` copies strings at 1, 8, or 32 octets at a time using block load and store instructions.
* ``m_strcmp`` compares two strings, 1 character at a time.


Dynamic Memory Allocation
-------------------------

A simple, Dynamic Memory Allocation or heap was implemented. For this deliverable it has been refactored to use constant time allocation and deallocation.  It is currently used for storing Kernel Messages.

It uses an array of booleans to track which blocks of memory have been allocated. The blocks of memory are implemented as a ``char`` array.

To allocate memory, it searches the array of booleans for a free spot and returns a pointer. Freeing memory simply requires calculating the index of array of boolean and setting it to 0.

See Performance.


RPS
+++

The ``RPSServer`` has been refactored to fix synchronization problems. It is used for stress testing the OS. At least 480 tasks should run without problems.


IdleTask and AdministratorTask
++++++++++++++++++++++++++++++

The Administrator Task is responsible for helping us exiting to RedBoot.

The Idle Task runs when all tasks are blocked. The Administrator Task keeps track the number of tasks running. The Clock Clients will tell the Administrator Task when it has shutdown. After all tasks have exited, the Administrator Task will tell the Idle Task to exit.


Random Number Generator
+++++++++++++++++++++++

File: ``random.h``

A LCG is used as the random number generator. It uses the GCC values as noted on Wikipedia. The seed is multiplied by an arbitrary number to get the generator going.


Assert
++++++

The assert statement has been enhanced to show Thomas The Tank Engine. Please do not be alarmed when you see it.


Performance
+++++++++++

In this deliverable we have made several changes that significantly improve the performance of our kernel:

1)  Time slicing
2)  Constant time memory allocation
3)  Constant time unblocking of tasks on events.
4)  Works with all gcc optimization levels.

Time slicing now occurs each time a timer interrupt fires.  This allows a slow running user task to be preempted on a timer interrupt, and we can then schedule the notifier immediately so that any high priority user tasks can be unblocked quicker.  This is especially important since it means we no longer have to worry about worst case execution time of low priority processes that may mistakenly avoid calling the Pass function.

Constant time memory allocation is now used instead of the linear time memory allocation that was used before.  The implementation details of this are described in the data structures section.

Constant time unblocking of tasks has been added by adhereing to the convention that only one task can be blocked on a particular event at a time.  This removes the necessity to iterate through all tasks checking for their state, and unblocking them if they are blocked on the event being triggered.  This update saved as much as 540us on interrupts that involved unblocking tasks.

Finally, our kernel has been updated to work in all compillation levels.  Our O3 version runs about twice as fast as the O0 version.

Source Code
===========

The source code is located at ``/u4/chfoo/cs452/group/k4-submit/io/kernel4``. It can be compiled by running ``make``.

Source code MD5 hashes::

    TODO
    TODO
    TODO


Elf MD5 hash::

    TODO


Git sha1 hash: ``TODO``





