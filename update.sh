#!/bin/sh

GTTS="gtts"
OUT="README.md"

# make tts files
echo "[ MAKE TTS FILES ]"
$GTTS

echo "[ MAKE LIST FILES ]"
echo > $OUT
for file in *.txt
do
	fname=`echo $file | sed 's/.txt//'`
	cat<<EOF >>$OUT
* $fname <audio controls style="width:120px;">
  <source src="${fname}.mp3" type="audio/mpeg">
    Your browser does not support the audio element.
</audio>
EOF
	cat $file >> $OUT
done

    
git add .
git commit -m "update files" .
git push
