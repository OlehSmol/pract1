#!/bin/sh

#You need imagemagick
#run sudo apt-get install imagemagick


re='^[0-9]+$'

echo -n "Do you wish to set custom start value (default 0)? "
read i

if ! [[ $i =~ $re ]] ; then
   i=0
fi

echo -n "Do you wish to set custom value size (default 8)? "
read sz

if ! [[ $sz =~ $re ]] ; then
   sz=8
fi

for file in $(ls *.{jpg,png,gif,bmp} 2>/dev/null); do
	NOW=$(date +"%S_%M_%H-%d-%m-%Y") 
	printf -v j "%0${sz}d" $i
	echo "converting $file ----> $NOW-$j.jpg"
	convert $file "$NOW-$j.jpg"
	((i++))
done
