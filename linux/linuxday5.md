Assignment 5

TASK 1 :- How would you check:-
a) Memory used by a process (RAM)?
Ans- 4 commands to check memory used by a process :-
1. free command
2. top command
3. htop
4. ps -aux –sort rss

b) Total number of open files by a process?
Ans- lsof -p (pid)

c) Running duration of a process?
Ans- ps -aux command

Task 2 :- What is file descriptor?         
Ans- A file descriptor is a number that uniquely identifies an open file in a computer's operating system. It describes a data resource, and how that resource may be accessed.
When a program asks to open a file — or another data resource, like a network socket — the kernel of the operating system grants access, makes an entry in the global file table, and provides the software with the location of that entry.
The descriptor is identified by a unique non-negative integer, such as 0, 12, or 567. At least one file descriptor exists for every open file on the system.
TASK 3 :- How to kill a process :-
Ans- A process, also known as a task, is the running form of a program. Programs are stored on disk and processes run in memory. Processes have a parent/child relationship. A process can spawn one or more children. Multiple processes can run in parallel.
The process status (ps) command lists the processes that are associated with your shell.
Forcefully – kill -9  
Gracefully – kill ,  pkill
TASK 4 :-  What are signals?
Ans :- A somewhat common (though if it happens to you a lot, than that may be sign that something is wrong) issue is when you run kill <pid> on a process and the process does not terminate. This can happen for many reasons but what can you do in those scenarios? Well a common response is to use the kill command with the -9 flag.

So why does -9 work? Well when the kill command is run it is actually sending a singal to the process. By default the kill command will send a SIGTERM signal to the specified process.
Signal Numbers and Dispositions

Each signal has a numeric Value and an Action associated to it, the numeric values can be used with commands such as kill o define which signal is sent to the process. Each signal also has an "action" or "disposition" associated with it which defines what type of action this signal should invoke.
Signal Actions
While there are several actions for the various signals on a Linux system, I want to highlight the below as they are the most commonly used signals from a process termination perspective.
Term - This action is used to signal that the process should terminate
Core - This action is used to signal that the process should core dump and then terminate
Common signals
SIGHUP - 1 - Term
The SIGHUP signal is commonly used to tell a process to shutdown and restart, this signal can be caught and ignored by a process.
Syntax:# kill -1 <pid>
# kill -SIGHUP <pid>
SIGINT- 2 - Term
The SIGINT signal is commonly used when a user presses ctrl+c on the keyboard.
Syntax:# kill -2 <pid>
# kill -SIGINT
SIGQUIT - 3 - Core
TheSIGQUITsignal is useful for stopping a process and telling it to create a core dump file. The core file can be useful for debugging applications but keep in mind your system needs to be setup to allow the creation of core files.
Syntax:# kill -3 <pid>
# kill -SIGQUIT <pid>
SIGKILL - 9 - Term
The SIGKILL signal cannot be ignored by a process and the termination is handled outside of the process itself. This signal is useful for when an application has stopped responding or will not terminate after being given the SIGTERM command. This signal should stop more processes however there are exceptions, such as zombie processes.
Syntax:# kill -9 <pid>
# kill -SIGKILL <pid>
SIGSEGV - 11 - Core
TheSIGSEGVsignal is generally sent to a process by the kernel when the process is misbehaving, it is used when there is an "Invalid memory reference" and you may commonly see a message such as segmentation fault in log files or via strace. You can also technically call this signal with kill as well; however it is mainly useful for creating core dump files, which can also be performed by using the SIGQUIT signal.
Syntax:# kill -11 <pid>
SIGTERM - 15 - Term
The SIGTERM signal is the default signal sent when invoking the kill command. This tells the process to shutdown and is generally accepted as the signal to use when shutting down cleanly. Technically this signal can be ignored, however that is considered a bad practice and is generally avoided.
Syntax:# kill <pid>
# kill -15 <pid>
Don't run kill -9 unless you really have to. If the process isn't stopping right away give it a bit more time, or try to find out if the process is waiting on a child process to finish before running kill -9.
TASK 3 :- What is PPID?
Ans – One very important process is called INIT. 
INIT is the grandfather of all processes on the system because all other processes run under it.
Every process can be tracked back to INIT & it always has a PID of 1. The kernel itself has a PID of 0.
PPID 
In addition to unique process ID, each processes is assigned a parent process ID (PPID) that tells which process started it. The PPID is the PID of the processes parent.
For example:- If process 1 with a PID of 101 starts a processes named process 2, the process 2 will be given a unique PID, such as 3240, but it willl be given the PPID of 101.
Its a parent-child relationship. A single parent process may severel child process, each with a unique PID but all sharing the same PPID.

# ps -f pid (to check the parent process id of a process)       

TASK 4 :- How to print a PID of the current shell?
Ans - # echo $$
         # ps -p $$


TASK 5 :- How to clear a log file of a running process?
Ans - 
Empty file using cat/cp utilities with /dev/null
In Linux, the null device is basiclly utilized for discarding of unwanted output streams of a process or else as a suitable empty files for input streams.
This is normally done by redirection mechainism.
# cat /dev/null > access.log
# cp /dev/null > access.log



TASK 5 :- What will happen if you delete a log file of running process?
Ans – If you will delete a log file of a running process or try to move it to some other place then the process itself will make another log file at the same place with the same memory which will result to consume double than before. 

TASK 6 :- How do you check all the running process in the system?
Ans – TOP command
# ps -aux | less

TASK 7 :- What is DNAT and SNAT, Explain both with an example?
Ans - Destination NAT
Destination NAT means, we translate the destination address of a packet to make it go somewhere else instead of where it was originally addressed. For our scenario, it is:
# iptables -t nat -A PREROUTING -d 10.10.10.99/32 -j DNAT –to-destination 192.168.1.101
Now all IP packets coming to our machine’s (A) IP address of 10.10.10.99 will be rewritten and sent to 192.168.1.101 instead. This translation is transparent to the machine the connection is originating from and to machine B.
So if you connect from, say, 172.16.1.10 to 10.10.10.99, the packet will be rewritten upon reaching machine A and be sent to machine B. Machine B will see it coming from 172.16.1.10, it will have no idea that the connection was redirected by 10.10.10.99. This is important because when machine B replies, the FROM address in it’s reply will be it’s own IP address of 192.168.1.101.
This will cause a protocol error on your machine because your machine (172.16.1.10) will be expecting a reply from 10.10.10.99 and instead will receive a reply from 192.168.1.101.
To fix this, we now need to do SNAT – Source Network Address Translation.
SOURCE SNAT
We want to do SNAT to translate the from address of our reply packets to make them look like they’re coming from 10.10.10.99 instead of 192.168.1.101. To do this, we need to apply a SNAT iptables rule on a router along the path these reply packets will take. Since our machine A is the default gateway for machine B, we will do the SNAT on machine A as well.
iptables -t nat -A POSTROUTING -s 192.168.1.101/32 -j SNAT –to-source 10.10.10.99
This rewrites our source address to look like the packets are coming from 10.10.10.99 instead of 192.168.1.101.
At this point, try to connect to machine A using SSH and log in using credentials for machine B.
Once you’ve confirmed this works, you can save your iptables configuration with:
service iptables save
You can then configure iptables to run at startup automatically.
/sbin/chkconfig –level 3 iptables on
/sbin/chkconfig –level 5 iptables on
And that concludes a basic DNAT/SNAT configuration. In most situations you may want to narrow down the match criteria to specific protocols or ports. e.g. you can use the “-p tcp –dport 22” flags to match only SSH traffic.
If you’d like me to expand upon any of this further, please leave a comment asking for details.

Task 8:- How do you you elevate the priority of a processs
Ans:- The Linux niceness scale goes from -20 to 19.
How to Check Nice Value of Linux Processes
# ps -eo pid,ppid,ni,comm
Setting priority of existing process 
#renice value -p pid
Setting priority on new processes
nice -n [nice value] [command]:
Task9:- How many tables are there in iptables. What filter and nat table responsible for
Ans:-
Let's step back for a moment and take a look at the different tables that iptables provides. These represent distinct sets of rules, organized by area of concern, for evaluating packets.
The Filter Table
The NAT Table
The Mangle Table
The Raw Table
The Security Table
The Filter Table
The filter table is one of the most widely used tables in iptables. The filter table is used to make decisions about whether to let a packet continue to its intended destination or to deny its request. In firewall parlance, this is known as "filtering" packets. This table provides the bulk of functionality that people think of when discussing firewalls.
The NAT Table
The nat table is used to implement network address translation rules. As packets enter the network stack, rules in this table will determine whether and how to modify the packet's source or destination addresses in order to impact the way that the packet and any response traffic are routed. This is often used to route packets to networks when direct access is not possible.




