#!/usr/bin/env bash
#
# block script for hosts that tries frute force on SSH
#

#for source in 109.197.192.0/22 59.44.0.0/13 185.106.92.0/24 183.0.0.0/10 61.244.0.0/16
#for source in 218.87.0.0/16 116.16.0.0/12 221.192.0.0/14 
#for source in 218.65.0.0/15 121.16.0.0/13
#for source in 61.177.0.0/16 182.100.0.0/16   
#for source in 177.220.137.196/30 202.100.245.0/24 211.220.207.0/24 
#for source in 178.150.236.0/24 
#for source in 111.0.0.0/10 
for source in $( cat blocklist.txt)
do
	echo -n "Blocking: $source ... "
	iptables -I INPUT   -s $source -j DROP
	iptables -I FORWARD -s $source -j DROP
	echo "done"
done
