#!/bin/bash

DIR_LOG=/DIR/DIR/bin/nohup.out
DIR1_LOG=/DIR/DIR_DIR1/bin/nohup.out
SIZE_LIMIT=1073841824 # > 1GB
CURR_SIZE_1=$(stat -c '%s' "$DIR_LOG")
CURR_SIZE_2=$(stat -c '%s' "$DIR1_LOG")
MAILADDR="someone@somedomain.com"

if [ $(ls -l $DIR_LOG | awk '{print $5}') -gt $SIZE_LIMIT ]; then
       	
	echo $CURR_SIZE_1
	
	:> $DIR_LOG
        
	echo "The size of the $DIR_LOG file on $(hostname) as of $(date) was $CURR_SIZE_1 bytes or > 1GB!! - It was zeroed out" |
        mail -s "FYI - The size of $DIR_LOG the nohup file had exceeded 1GB" $MAILADDR

fi

sleep 30

if [ $(ls -l $DIR1_LOG | awk '{print $5}') -gt $SIZE_LIMIT ]; then
        
	echo $CURR_SIZE_2
	
	:> $DIR1_LOG        
	
	echo "The size of the $DIR1_LOG file on $(hostname) as of $(date) was $CURR_SIZE_2 bytes or > 1GB!! - It was zeroed out" |
        mail -s "FYI - The size of the $DIR1_LOG nohup file had exceeded 1GB" $MAILADDR

fi

sleep 30
