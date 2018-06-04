Assignment 1

Assignment1:
Initialize a directory as git repository.
#mkdir gittask
#cd gittask
#git init

Create a blank files like a.txt, b.txt.
#touch a.txt b.txt

Write "Hi Team Ninja" into a.txt
#echo “Hi Team Ninja” > a.txt
Write "This is VCS:Git" into b.txt
#echo “This is VCS:Git” > b.txt

Set git config variables.
#git config –global user.name “Tarun Goel”
#git config –global user.email tarun.goel1995@gmail.com

Commit both files.
#git add -A
#git status
#git commit -a -m “adding a.txt b.txt in master branch”
#git log
Create a branch ninja
# git branch ninja
Switch into branch ninja
#git checkout ninja
Update file b.txt with ""This is VCS:Git. This is ninja branch"
#echo “ This is VCS:Git. This is ninja branch” > b.txt
Check for the difference made in the file.
#git diff
Commit your changes in ninja branch.
#git add -A
#git status 
#git commit -a -m “modifying b.txt in ninja branch”
#git log
Check difference between last two commits.
#git diff commitid1..commitid 2

Rename your file b.txt to c.txt
#mv b.txt c.txt
Commit your changes.
#git status
#git add -A
#git commit -a -m “renaming b.txt to c.txt in ninja branch”
#git log
Remove file c.txt.
#rm c.txt
#git status
Commit your changes.
#git commit -a -m “removing c.txt in ninja branch”
#git log
Create a file text.txt and add it.
#touch text.tx
#git add -A
Remove it from the staging area.
#git reset HEAD text.tx
or
#git rm –cached text.txt
#git status

Assignment2:
Create a account on github.com.
#Account created on github.com and the ssh key also been added to account for secure push.
Fork ot-training/git repo into your account.
#Forked by clicking on the Fork button on the extreme right. And got it as tarungoel1995/git.
Clone your repo into your machine.
#cloned the tarungoel1995/git repo in vagrant machine.
           # mkdir opsgit
           # cd opsgit
          # git clone https://github.com/ot-training/git.git

Assignment3:
Clone your repo into your machine.
#alrady done above
Add a file to the attendees directory that describes you (ex. filename wouild be your name like saurabh.vajpayee.txt).
#cd git/attendees
#touch tarun.goel.txt
Commit your changes. Write a meaningful message like "Added information about YOUR NAME HERE."
#git status
#git add -A
#git commit -m “Added information about Tarun Kumar”
Save your changes into remote repo.
#git push origin master
Check list of changes in your repo.
#git diff f1ff552457a..e311b96f
Output:-
diff --git a/attendees/tarun.goel.txt b/attendees/tarun.goel.txt
new file mode 100644
index 0000000..e69de29
Add your name into attendees/assignments/day1/attendees.md
#cd /opsgit/git/attendess/assignments/day1
#echo “Tarun Kumar” > attedndess.md
#git add -A
#git status
#git commit -m “adding my name into attendees.md”
#git push origin master 
