#!/bin/bash
obs_tmp=$(cat /Users/sanifred/work/code/projects/weather_report/report | /opt/homebrew/bin/ggrep -oP "\d*(?=(\((\d+)\))?\s°C)" | sed "1q;d")
fc_tmp=$(cat /Users/sanifred/work/code/projects/weather_report/report | /opt/homebrew/bin/ggrep -oP "\d*(?=(\((\d+)\))?\s°C)" | sed "3q;d")
hour=$(TZ=Morroco/Casablanca date +%r)
day=$(TZ=Morroco/Casablanca date +%d)
month=$(TZ=Morroco/Casablanca date +%m)
year=$(TZ=Morroco/Casablanca date +%Y)

echo -ne "\n$year\t$month\t$day\t$obs_tmp\t$fc_tmp" >> /Users/sanifred/work/code/projects/weather_report/rx_poc.log