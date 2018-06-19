echo "Enter any charcter you want to print: "
read character
echo "Enter no of times you want to print $character:  "
read num
i=1
while [ $i -le $num ]
do
echo "$character"
i=$((i+1))
done

