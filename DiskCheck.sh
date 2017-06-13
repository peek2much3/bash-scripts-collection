#!/bin/sh
 
df -HlP | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
 
    do
 
      echo $output
 
      usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1 )
 
      partition=$(echo $output | awk '{ print $2 }' )
 
     if [ $usep -ge 85 ]; then
 
        echo "Disk space of partition: \"$partition is at ($usep%)\" on $(hostname) as on $(date)" |
 
        mail -s "Disk space warning on $(hostname) is at $usep%" someone@somedomain.com
 
        fi
 
    done
