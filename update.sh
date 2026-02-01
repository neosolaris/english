#!/bin/sh

GTTS="gtts"
OUT="README.md"

# make tts files
echo "[ MAKE TTS FILES ]"
$GTTS

echo "[ MAKE LIST FILES ]"
for file in *.txt
do
	echo "* $file" >> $OUT
	cat $file >> $OUT
	echo >> $OUT
done

git add .
git commit -m "update files" .
git push
