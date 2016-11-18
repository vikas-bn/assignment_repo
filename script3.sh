#!/bin/bash
timestamp=$(date +%s)
ps | awk '{ print $1 }' >> tmp.txt
cat tmp.txt > pid.txt
rm tmp.txt
