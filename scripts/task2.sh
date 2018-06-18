<<comment
TASK 1:

* Print "Enter any single digit or double digit number" 
* Read input from the user
* If number is of single digit then print "Its a single digit number"
* If number is of double digit then print "Its a double digit number"
* If number is of greater than double digit then print "Invalid choice"
comment

#!/bin/bash
echo "Enter any single digit or double digit number: "
read num
if [ "${#num}" -eq 1 ]
then 
  echo "Its a single digit number"
elif [ "${#num}" -eq 2 ]
then 
  echo "Its a double digit number"
elif [ "${#num}" -eq 3 ]
then
  echo "Its a three digit number"
else
  echo "invalid choice"
fi
