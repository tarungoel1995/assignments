echo "Enter no of line you want to print: "
read num
echo "Enter 1 for Asscending 2 for Descending 3 for Pyramid: "
read pattern


if [ $pattern -eq 1 ]
then
for ((i=1;i<=num;i++))
do
for ((j=1;j<=i;j++))
do 
echo -n "*"
done
echo ""
done

elif [ $pattern -eq 2 ]
then
for ((i=1;i<=num;i++))
do
for ((j=num;j>=i;j--))
do
echo -n "*"
done
echo ""
done

elif [ $pattern -eq 3 ]
then
for (( i = 1; i <= num; i++ ))
do
for (( k = num; k >=i; k-- ))
do
    echo -ne " "
done
for (( j = 1; j <= 2 * i - 1; j++ ))
do
    echo -ne "*"
done
echo " "
done
fi
