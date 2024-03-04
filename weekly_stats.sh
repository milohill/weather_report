#!/bin/bash
tail -7 synthetic_historical_fc_accuracy.tsv | cut -f6 > scratch.txt

history=($(echo $(cat scratch.txt)))

for el in ${history[@]}; do
    echo ${el#-} >> abs.txt
done

max=$(cat abs.txt | head -1)
min=$(cat abs.txt | tail -1)

echo "Max: $max, min: $min"