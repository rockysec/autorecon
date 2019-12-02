#!/bin/bash
mkdir headers
mkdir responsebody
CURRENT_PATH=$(pwd)
for x in $(cat $1)
do
        NAME=$(echo $x | awk -F/ '{print $3}')
        curl --insecure -X GET -H "X-Forwarded-For: hackerone_rockysec" $x -I > "$CURRENT_PATH/headers/$NAME"
        curl --insecure -s -X GET -H "X-Forwarded-For: hackerone_rockysec" -L $x > "$CURRENT_PATH/responsebody/$NAME"
done
