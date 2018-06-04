Assignment 2

Task 1 :- Make 5 partitions in pendrive
Steps :- Making partitions
              #umount /dev/sdb1(to unmount the pendrive)
                    #lsblk (to check wether pendrive is still mounted or not)
                    #sudo mkfs -t ext4 /dev/sdb
                    #lsblk --fs
                   #fdisk /dev/sdb
                           First partition –     n -> p -> 1 -> enter -> +10M (sdb1)
                           Second partition -  n -> p -> 2 -> enter -> +10M (sdb2)
                           Third partition -    n -> p -> 3 -> enter -> +10M (sdb3)
                           Extended part     - n -> e -> enter -> +7G            (sdb4)
                           Fourth partition -  n -> enter -> +50M                (sdb5)
                           Fifth partition -      n -> enter -> +50M                (sdb6)
                                                            w -> (saves the partition on disk) 
               #partprobe (save to the kernel)

Monuting these partitions:-
                # cd /
                           # sudo mkdir mnt1 mnt2 mnt3 mnt4 mnt5 (made the mount points)
                           # sudo mkfs.ext4 /dev/sdb1 (giving file system to 1st partition)
                           # sudo mkfs.ext4 /dev/sdb2 (giving file system to 2ndpartition)
                           # sudo mkfs.ext4 /dev/sdb3 (giving file system to 3rdpartition)
                           # sudo mkfs.ext4 /dev/sdb5 (giving file system to 4thpartition)
                           # sudo mkfs.ext4 /dev/sdb6 (giving file system to 5thpartition)
                           # sudo mount /dev/sdb1 /mnt1
                           # sudo mount /dev/sdb2 /mnt2
                           # sudo mount /dev/sdb3 /mnt3
                           # sudo mount /dev/sdb5 /mnt4
                     # sudo mount /dev/sdb6 /mnt5


Checking:-
                              # cd /mnt1
                          # sudo touch test.txt
                           # sudo umount /dev/sdb1
                              # Similarly for all other partitions.




Task2 :- Logical Volume Management
Step1 :-  Creating a LVM of 1GB
 #sudo parted -a opt /dev/sdb mkpart primary ext4 0% 100%
 #sudo lvmdiskscan
 #sudo pvcreate /dev/sdb
 #sudo pvs
 #sudo vgcreate LVMgroup /dev/sdb
 #sudo vgs
 #sudo lvcreate -L 1G -n projects LVMgroup
 #sudo vgs
 #sudo lvdisplay
Step2 :- Extending the size to 1.5GB
                     #lvextend -L+500M /dev/LVMgroup/projects
                     #sudo lvextend -L+500M /dev/LVMgroup/projects
                     #sudo lvdisplay
 Step3:- Reducing the size to 500MB
                    #sudo resize2fs -p /dev/LVMgroup/projects 500M
                   #sudo fsck -t ext4 -f /dev/LVMgroup/projects
                   #sudo mkfs.ext4 /dev/LVMgroup/projects
                   #sudo e2fsck -ff /dev/LVMgroup/projects
                   #sudo resize2fs -p /dev/LVMgroup/projects 500M
                  #sudo lvdisplay
                  #sudo lvreduce -L 500M /dev/LVMgroup/projects
                  #sudo resize2fs /dev/LVMgroup/projects
                  # sudo lvdisplay(to confirm) 


Task3:- Scripting Task
#!/bin/bash
    char=”2”
    #abc=echo -n $char|wc -c
    if [$char -gt “9” ] && [$char -it “100”]
    then
    echo “double digit”
    else
    if [ $char -it “10” ]
    then
    echo “its single digit”
    else
    echo “invalid code”
    fi
