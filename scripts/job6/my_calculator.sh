if [ "$2" == "x" ]
then
multiplication=$(($1*$3)) 
echo "$multiplication" 

elif [ "$2" == "/" ]
then
division=$(($1/$3))
echo "$division"

elif [ "$2" == "+" ]
then
addition=$(($1+$3))
echo "$addition"

elif [ "$2" == "-" ]
then
substraction=$(($1-$3))
echo "$substraction"

else
echo "end"
fi
