<<comment
TASK:

* Create a variable and assign your name to this variable
* Print this variable in 3 diff style like below example
   Suppose the variable holds "Opstree" name, so it should print like this:

   **  Opstree , Hello

   **  Hello , Opstree

   **  Hello , Opstree
How r u ? ------> (Print this in new line)

comment

#!/bin/bash
echo "Enter you good name please: "
read name
echo $name , "Hello"
echo "Hello", $name
echo -e Hello, $name '\n'How are you?
