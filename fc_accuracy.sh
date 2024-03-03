#!/bin/bash

IFS= # prevent echo below from delimiting the row with spaces
row=$(cat rx_poc.log | tail -1)
year=$(echo $row | cut -f1)
month=$(echo $row | cut -f2)
day=$(echo $row | cut -f3)
yes_fc_tmp=$(tail -2 rx_poc.log | head -1 | cut -f5)
tod_ob_tmp=$(tail -1 rx_poc.log | cut -f4)
accuracy=$(($tod_ob_tmp - $yes_fc_tmp))
echo $accuracy
abs_accuracy=${accuracy#-} # get the absolute value of the accuracy number

if [ $abs_accuracy = 0 ]
then
    label='spot on'
elif
    [ $abs_accuracy = 1 ]
then
    label='excellent'
elif
    [ $abs_accuracy = 2 ]
then
    label='good'
elif
    [ $abs_accuracy = 3 ]
then
    label='fair'
elif
    [ $abs_accuracy = 4 ]
then
    label='poor'
fi

echo -ne "$year\t$month\t$day\t$tod_ob_tmp\t$yes_fc_tmp\t$accuracy\t$label\n" >> historical_fc_accuracy.tsv