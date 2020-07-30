#!/bin/bash

timestamp=$(date "+%Y%m%d-%H%M%S")

for i in {1..4}
do 
    if [[ "$(curl -s -o /dev/null -w ''%{http_code}'' $1)" != "200" ]] 
    then
        status="n/a"
        timestamp=$(date "+%Y%m%d-%H%M%S")
        echo "$timestamp | Site not found"
        sleep 30s
    else
        status="200"
        timestamp=$(date "+%Y%m%d-%H%M%S")
        echo "$timestamp | $status"
        if [[ $status -eq 200 ]]
        then
            break
        fi
    fi
    
done

if [[ $status = "n/a" ]] 
then
    echo "API DOWN"
    exit 1;
else    
    echo "API UP"
fi 
