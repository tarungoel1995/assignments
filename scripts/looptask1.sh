<<comment
* Print "Enter any charcter you want to print" 
* Read input from the user (say mychar variable)
* Print "Enter no of times you want to print {{Character }} "   -----> value of character should be printed.
* Read input from the user (say n variable)
* Print the mychar variable n no of times using for loop
comment

echo "Enter any charcter you want to print: "
read character
echo "Enter no of times you want to print $character:  "
read num

for ((i=1;i<=num;i++))
do
echo "$character"
done
