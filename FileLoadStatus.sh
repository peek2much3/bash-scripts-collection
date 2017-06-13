#!/bin/bash

#################################################################################################
# 
# 
#################################################################################################

export dt=$(date '+%m/%d/%Y %H:%M:%S')
export log_file=/home/USER/logs/log.txt
export msg=/home/USER/msg.txt
export count=`ls /SOME_DIR/SOME_DIR_1/*FILE* | xargs -n1 basename | wc -l`
export distro="someone@somedomain.com" 

if [ "$count" -eq 0 ]; then

exit 0

else
        ls /SOME_DIR/SOME_DIR_1/*FILE* | xargs -n1 basename >> $log_file
		echo "-----------------" >> $log_file
		echo "Total Count:" $count >> $log_file
		mail -s "Email title" -a $log_file $distro < $msg
        sleep 5
                :> $log_file
fi

exit 0

