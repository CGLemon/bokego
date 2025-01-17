#!/bin/bash

# Scores SGF files with GNUGO

for file in $1;
do
    res="$(grep "RE\[\w*\]" $file)"
    if [ -z "$res" ]; then
        score="$(echo "final_score" | gnugo --mode gtp --chinese-rules -l $file | cut -d' ' -f 2)"
        echo $score
        sed -i "/SZ\[9\]/ a RE[${score}]" $file
    fi
done
