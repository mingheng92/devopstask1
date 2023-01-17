#!/bin/bash
counter=$(awk '$9~/^[4-5]/ {++count} END {print count}' $1)
echo $(awk '$9~/^[4-5]/' $1) > 'HTTP4xx_5xx.log'
if [ $counter -gt 100 ]
then
    echo -e "Hi DevOps Team, the number of HTTP 4xx/5xx had exceeded 100 times. \nTotal number is $counter. \nKindly check the following attachement. \n\nBest Regards,\nMonitoring team" \
    | mail -s "HTTP 4xx/5xx Errors Exceeded 100 times" -A 'HTTP4xx_5xx.log' -a From:Admin chinmingheng92@gmail.com
fi