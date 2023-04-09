#!/usr/bin/env bash
rm -f tmp

echo "INPUT:">> tmp
cat ./ai_settings.yaml >> tmp
echo >> tmp
echo >> tmp

echo "GENERATED FILES:">> tmp
echo >> tmp
echo >> tmp
for i in $(ls ./auto_gpt_workspace/*.txt | sort); do 
    echo "$(basename $i)" >> tmp
    echo "==================================================" >> tmp
    cat $i  >> tmp
    echo >> tmp
    echo >> tmp
    echo >> tmp
    echo $i
done
echo "BOT ACTIVITY:">> tmp
echo >> tmp
echo >> tmp
cat $1 >> tmp
cat tmp | sed 's/. Thinking...*\(.....MAKE\)/\n\n\n\1/' |  sed 's/..Thinking.*Warning:/Warning:/' | ansi2html > $1.html

