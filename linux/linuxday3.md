Assignment 3

Task1:- Make a script and pass 5 command line arguments (arguments value should be interger)
Script:- #!/bin/bash
                     echo $1, $5
                     if [ $2 -eq 10 ]
                     then
                     echo "INDIA"
                     else
                     echo "india"
                     fi
                     sum=$(expr $1 + $2 + $3 + $4 + $5)
                     echo $sum
Output1:-
# ./task1.sh 2 10 5 6 8
2, 8
INDIA
31
Output2:-
# ./task1.sh 2 2 5 6 8
2, 8
india
23

Task2 :- Make a script and pass one command line arguments(use loop)
print the table of command line argument if value is less 10
print 5 times "INDIA" if value is greater than or equal to 10
Script:- #!/bin/bash
if [ $1 -le 9 ]
then
for i in 1 2 3 4 5 6 7 8 9 10
do
a=$( expr $1 '*' $i)
echo $a
done
elif [ $1 > 10 ]
then
for i in 1 2 3 4 5
do
echo "INDIA"
done 
fi


Output1 :- # ./task2.sh 9
9
18
27
36
45
54
63
72
81
90
Output 2:- #  ./task2.sh 10
INDIA
INDIA
INDIA
INDIA
INDIA

Task3 :- Make a script and print your name 10 times(use fuction to print your name)
Script:- #!/bin/bash
printname ()
{
for i in {1..10}
do 
echo $1
done
}
printname $1 
Output:- #./task3.sh Tarun
Tarun
Tarun
Tarun
Tarun
Tarun
Tarun
Tarun
Tarun
Tarun
Tarun
Task4:- Make a excel sheet manually with 5 column, and print the 1st,3rd and 5th column
Command:- # sed 's/,/ /g' filename.csv | awk '{print $1,$3,$5}'


Task5 :- Install the zabbix-agent using shell script
Script :- #!/bin/bash
sudo apt-get update
sudo apt-get install zabbix-agent -y
sudo systemctl start zabbix-agent
sudo sed -i 's/Server=127.0.0.1/Server=zabbix.opstree.com/' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/Hostname=Zabbix/Hostname=192.168.0.20-zabbixagent/' /etc/zabbix/zabbix_agentd.conf
sudo service zabbix-agent restart

Task 6:- Make a script in which you will pass a git repo path and it will generate a html report of last 5 days commits.
html report should contain
Commit Message
Commit ID
Author Name
Commit Date

Script:- #!/bin/bash
mkdir gittest.sh
cd gittest.sh
sudo git clone https://github.com/apache/hadoop.git -y
sudo chmod 777 hadoop
cd  hadoop
sudo git log –since=”5 days” --pretty=format:’%cd,%an,%B,%cm’ > log.csv
cat log.csv
(Note:- Still not able to show the output in proper html report . Still working on that.)

Task7:- Print "Enter any charcter you want to print”
Read input from the user (say mychar variable)
Print "Enter no of times you want to print {{Character }} " -----> value of character should be printed
Read input from the user (say n variable)
Print the mychar variable n no of times using for loop
(Given by Rajat Sir)
Script:- #!/bin/bash
printf "Enter any charcter you want to print: "
read character
echo "Enter number of times you want to print $character"
read number
echo $number
for i in  $(seq "$number")
do
echo $character
done
Output:- # ./rajat.sh
Enter any charcter you want to print: Tarun
Enter number of times you want to print Tarun
5
5
Tarun
Tarun
Tarun
Tarun
Tarun 