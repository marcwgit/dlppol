#!/bin/bash
Files=/home/marcwe/dlppol/*.html
#outputf=""
echo "line 2"
i=0
for f in $Files
do
echo $f
#$outputf ${f/html/pdf}
outputf=${f%%html}
outputf="$outputf""pdf"
#outputf1="$outputf""pdf"
echo ${f/html/pdf}
echo '$outputf'"1"
echo 'outputf'"2"
echo ${outputf}"3"

i=$((i+1))
#wkhtmltopdf $f ${i}.pdf
#wkhtmltopdf "$f" "echo ${f/html/pdf}"
wkhtmltopdf "$f" "${f/html/pdf}"
#wkhtmltopdf "$f" "$outputf"
#wkhtmltopdf "$f" "$outputf1"
#wkhtmltopdf "$f" "$i.pdf"
done
stringZ=abcABC123ABCabc
#       =======	    

echo `expr match "$stringZ" '\(.[b-c]*[A-Z]..[0-9]\)'`   # abcABC1
echo `expr "$stringZ" : '\(.[b-c]*[A-Z]..[0-9]\)'`       # abcABC1
echo `expr "$stringZ" : '\(.......\)'`                   # abcABC1
# All of the above forms give an identical result.

stringZ=abcABC123ABCabc

echo ${stringZ/abc/xyz}       # xyzABC123ABCabc
                              # Replaces first match of 'abc' with 'xyz'.

echo ${stringZ//abc/xyz}      # xyzABC123ABCxyz
                              # Replaces all matches of 'abc' with # 'xyz'.

echo  ---------------
echo "$stringZ"               # abcABC123ABCabc
echo  ---------------
                              # The string itself is not altered!

# Can the match and replacement strings be parameterized?
match=abc
repl=000
echo ${stringZ/$match/$repl}  # 000ABC123ABCabc
#              ^      ^         ^^^
echo ${stringZ//$match/$repl} # 000ABC123ABC000
# Yes!          ^      ^        ^^^         ^^^

echo

# What happens if no $replacement string is supplied?
echo ${stringZ/abc}           # ABC123ABCabc
echo ${stringZ//abc}          # ABC123ABC
# A simple deletion takes place.