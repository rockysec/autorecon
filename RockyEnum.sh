##!/bin/bash
#starting sublist3r
python ~/tools/Sublist3r/sublist3r.py -d $1 -v -o domains.txt
#running assetfinder
~/go/bin/assetfinder --subs-only $1 | tee -a domains.txt
#running subfinder
~/go/bin/subfinder -d $1 | tee -a domains.txt
#starting amass enum
/usr/bin/amass enum -d $1 | tee -a domains.txt
#running Sudomy
date_scan=$(date +%m-%d-%Y)
cd ~/tools/Sudomy/
export GOPATH=$HOME/go
#export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
bash ./sudomy --no-probe -d $1
cat ~/tools/Sudomy/output/$date_scan/$1/subdomain.txt | tee -a ~/tools/RockySec/domains.txt
#removing duplicate entries
cd ~/tools/RockySec/
sort -u domains.txt -o domains.txt
#checking for alive domains
echo "\n\n[+] Checking for alive domains..\n"
cat domains.txt | ~/go/bin/httprobe | tee -a alive.txt
#formatting the data to json
cat alive.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > alive.json
cat domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > domains.json
