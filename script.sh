#!/bin/bash

#IP adrddesses with the most requests
cat access-4560-644067.log | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 10 > top10ip

#URL's with the most requests
cat access-4560-644067.log | awk '{print $7}' | sort |uniq -c | sort -nr | head -n 10 > top10url

#Server side error list
cat access-4560-644067.log | awk '($9 ~ /5../){print $9}' > err

#List of all return codes
cat access-4560-644067.log | awk '{print $9}' | sort | uniq -cd | sort -nr > cod

# send email
mail -s 'logs' -a ./top10ip -a ./top10url ./err ./cod logs@mail.ru
