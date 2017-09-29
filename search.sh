#!/usr/bin/bash

echo "Content-type: text/html"
echo ""
word=`echo "$QUERY_STRING" | awk '{split($0,array,"=")} END{print array[2]}'`
echo $word
size=${#word}
dictn=/usr/share/dict/words
path=/tmp/anlist
output=/tmp/list

cat /dev/null > $path
cat /dev/null > $output
echo "size of $word is $size"

egrep "^[$word]{$size}$" $dictn > $path

ansort=$(echo "$word" | grep -o . | sort | tr -d '\n ')
echo sorted string is $ansort

for i in `cat $path`
do
#echo $i
chksort=$(echo "$i" | grep -o . | sort | tr -d '\n ')
if [ "$chksort" == "$ansort" ]
then
echo "found a match $i"
echo $i >> $output
fi
done

cat <<EOT
<!DOCTYPE html>
<html>
<head>
        <title>Welcome to Anagram Solver application</title>
</head>
<body>
        <h1>The anagrams of the word $word is `cat /tmp/list` </h1>
</body>
</html>

