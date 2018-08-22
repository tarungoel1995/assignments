ASSIGNMENT 2 GIT

Assignment1:
Create a script to generate a mearge conflict.
```
#!/bin/bash
mkdir /home/vagrant/conflicttask
cd /home/vagrant/conflicttask
git init
touch abc.txt
echo “echo Hello” > abc.txt
git add -A
git commit -m "adding abc.txt from master branch"
git branch slave
git checkout slave
echo "echo \"Hello World\"" > abc.txt
git add -A
git commit -m "first commit from slave branch"
git checkout master
echo "echo Hello World!" > abc.txt
git add -A
git commit -m "second commit in abc.txt from master branch"
git merge slave
```

Create muliple braches and push changes for each branch into remote repo.
```
# created three branches of master (tarun,rahul,lovedeep) and then sub-branch of tarun (alien)
```
Link :- https://github.com/tarungoel1995/docker-assignment/tree/master

Create a script to clone remote repo and check out all existing remote branch.

```
#!/bin/bash
git clone https://github.com/tarungoel1995/docker-assignment
cd docker-assignment
git branch -a
Clone a particular folder from a remote repo.
mkdir clonedir
cd clonedir
git init
git remote add origin -f https://github.com/tarungoel1995/assignments.git
git config core.sparsecheckout true
echo "docker/*" >> .git/info/sparse-checkout
git pull origin master
ls
```

Assignment2:

Use both https and ssh protocal to clone your remote repo.
```
# git clone https://github.com/tarungoel1995/assignments.git

# git clone git@github.com:tarungoel1995/assignments.git

Change your working copy into a clonable remote repo

on system1 (where your working directory is present)
# cd /path/to/work/directory 
# git init
# you should be able to login via ssh(from remote to local)
on system2(in which you want to clone)
# git clone ssh://username@ipaddress/path/to/remote/repo 
```
Use file system protocal in both local and remote mode(clone from another machine using file protocal) to clone your repo.
# (Pending)

Ignore backup, swp and pyc file from being commited.
```
# cd /path/to/your/git/repo
# touch .gitignore
# git config –global core.excludeFile /path/to/your/.gitignore/file
# echo “*.pyc” > .gitignore
# touch abcd.pyc
# git status (you will not see any untracked abcd.pyc file)
```

Assignment3:

Add remote name parent for ot-training/jenkins to your own repo.

Check and verify two remotes.

```
# git clone https://github.com/tarungoel1995/jenkins.git
# cd jenkins/
# git remote add parent https://github.com/tarungoel1995/jenkins.git
# git remote -v (to verify)
# touch a.txt
# git add -A
# git commit -m "adding a.txt"
# git push parent master
# touch xyz.txt
# git add -A
# git commit -m "adding xyz.txt"
# git push origin master
```

Git fetch changes from parent repo.
#git clone https://github.com/tarungoel1995/jenkins.git
# git fetch parent master

Git merge changes into your branch.
# git merge parent/master 
# ls
Git pull changes from parent repo.
#added a file named yes.txt via gui in repo
# git pull parent master
# ls

Check for difference in fetch and pull also create a solutions.md file inside attendees/assignments/day2 with steps and snapshots.
Ans :- In the simplest terms, git pull does a git fetch followed by a git merge. You can do a git fetch at any time to update your remote-tracking branches under refs/remotes/<remote>/. This operation never changes any of your own local branches under refs/heads, and is safe to do without changing your working copy.
# cd /home/vagrant/jenkins/attendees/assgnments/day2
# touch solutions.md 

Assignment4:
Rename remote name from parent to main
# git remote -v
output:-
origin	https://github.com/tarungoel1995/jenkins.git (fetch)
origin	https://github.com/tarungoel1995/jenkins.git (push)
parenthttps://github.com/tarungoel1995/jenkins.git (fetch)
parenthttps://github.com/tarungoel1995/jenkins.git (push)
# git remote rename parent main
#git remote -v
Output:-
main	https://github.com/tarungoel1995/jenkins.git (fetch)
main	https://github.com/tarungoel1995/jenkins.git (push)
origin	https://github.com/tarungoel1995/jenkins.git (fetch)
origin	https://github.com/tarungoel1995/jenkins.git (push)

Remove main remote.
# git remote remove main
# git remote -v
output:-
origin	 https://github.com/tarungoel1995/jenkins.git (fetch)
origin	 https://github.com/tarungoel1995/jenkins.git (push)


Assignment5:
Save your solutions.md into your repo.
# git -a A
# git commit -m “saving solutions.md”
Try to push solutions.md into parent repo.
#(Pending, still working on this)
Create a pull request from your repo to master of parent repo.
#(Pending, still working on this)

Assignment6:
Create tags in your repo. 
# git branch (your tag will be done on current branch)
# git tag tt (tt is the tag name)

Push tags into remote repo. 
# git push origin - -tags
Now you can check tags

Create tag on a one day old commit.
# git log (search for the commit of last day)
# git tag -a ld ba67a79-m "last day commit tag" 


Checkout to a tag. 
# git checkout ld

Clone a repo with tag name.
# git clone --branch tt https://github.com/tarungoel1995/jenkins.git
 
Clone a repo with specific branch (other than master) 
# git clone --branch n https://github.com/tarungoel1995/jenkins.git

Clone a repo on a specific commit. 
# git clone https://github.com/lovedeepsh/git.git <commitID>

Assignment7:
Create git alias for different commands
# cd /home/vagrant
# vim .gitconfig
# add 
[alias]
        c = commit
        st = status
        l = log
        a = add
        p = push
or we can add using command also
#git config --global alias.c commit
#git config –list (to verify)

Share your aliases in attendees/assignments/day2/alias.md
link :- https://github.com/tarungoel1995/jenkins/tree/master/attendees/assignments/day2

Assignment8:
A developer is working on a feature on a branch, unfortunately he/she made a wrong commit. How would he/she recover from this situation without cleaning the working directory.
# git log
# git checkout commit-id-of-previous-version

You are working on a branch of a project. After modification, you thought that these modifications are quite less important but will work on later and for the time being, you should do some other implementation on the project using other branch. Is there any way to save your previous state of modification and get back it when required?
Ans :- Yes we can fulfill this requirement using GIT STASH.
	git stash temporarily stashes changes you've made to your 	working copy 	so you can work on something else, and then come back and re-apply 	them later on. Stashing is handy if you need to quickly switch context and 	work on something else, but you're mid-way through a code change 	and aren't quite ready to commit.
	For saving
# git stash save “any-message-you-want”
For retrieving
# git stash apply <index-no.-of-stash-saved>
or
	# git stash pop (This will pop out the last stash)

Try to list all the cases, where you can use checkout in GIT.
# - git checkout -b <new-branch> 
This will make a new branch and also checkout in it.
- git checkout <branchname>
This will checkout in already created branch.
- git checkout - -orphan <newbranch>
This will create an orphan branch. The changes commit to this branch will have no parents and it will start a new history.
- git checkout <commit-ID>
This will checkout to the specific commit.  

make a script in which you will pass a git repo path and it will generate a html report of last 5 days commits. html report should contain
commit message
commit ID
author name
Commit Date
Script:-
```
#!/bin/bash
mkdir gittest.sh
cd gittest.sh
sudo git clone https://github.com/apache/hadoop.git -y
sudo chmod 777 hadoop
cd  hadoop
sudo git log –since=”5 days” --pretty=format:’%cd,%an,%B,%cm’ > log.csv
cat log.csv
(Note:- Still not able to show the output in proper html report . Still working on that.)
```









