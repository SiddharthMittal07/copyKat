#!/bin/bash


count=0
arr=()
results=$(find / -name $1 2>/dev/null);
if [[ $results == "" ]]; then
	echo "No results found...";
	exit;
fi
for opt in $results; do
	arr+=($opt);
	count=$(( $count + 1 ));
done

if [[ $count -eq 1 ]]; then
	n=0;
else
	echo "Choose one from: "
	count=0
	for opt in $results; do
		echo "$count) $opt";
		count=$(( $count + 1 ))
	done;
	read n;
fi

echo "Copying $1..."
cp ${arr[n]} .
echo "Done..."
