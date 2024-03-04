#!/bin/bash
tail -7 /Users/sanifred/work/code/projects/weather_report/synthetic_historical_fc_accuracy.tsv | cut -f6 > /Users/sanifred/work/code/projects/weather_report/scratch.txt

history=($(echo $(cat /Users/sanifred/work/code/projects/weather_report/scratch.txt)))