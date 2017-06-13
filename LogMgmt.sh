#!/bin/bash

#############################################################################################################
# compress application logs older than 30 days and move them to backup and remove files older than 6 months #
#############################################################################################################

BACKUP_DIR="/SOME_DIR/backup/"
DIR_1="/SOME_DIR/SOME_DIR_LOADER/log/"
DIR_2="/SOME_DIR/SOME_DIR/logs/"
DIR_3="/SOME_DIR/DIR3/log/"
DIR_4="/SOME_DIR/DIR/log/"
DIR_5="/app/SOME_DIR/tools/log/"
DIR_6="/thirdparty/Oracle/weblogic/user_projects/domains/SOME_DIR_domain/servers/AdminServer/logs/"
DIR_7="/SOME_DIR/SOME_DIR_1/files/"
DIR_8="/SOME_DIR/SOME_DIR_2/files/"
SOME_FILE="/SOME_DIR/SOME_DIR_3/errors/"
SOME_FILE_BACKUP="/SOME_DIR/backup/SOME_FILE/"
CDATE=$(date "+%m-%d-%y %r")
TODAY=$(echo "$CDATE" | awk -F" " '{print $1 }')

date
echo "---------------------------------------------------------"

if [ ! -d $BACKUP_DIR/"$TODAY" ]
        then
            mkdir $BACKUP_DIR/"$TODAY"
        fi
# Compress any logs older than 30 days
for i in $(find $DIR_1/*.log.* $DIR_2/*.log.* $DIR_3/*.log.* $DIR_4/*.log.* $DIR_5/*.log* $DIR_6/*.log0* $DIR_7/*.info $DIR_8/*.errors -mtime +30)
        do
			echo "Compressing $i..."
			gzip -9 "$i"
        done
		
echo "Moving all zipped files to $BACKUP_DIR/$TODAY"

mv $DIR_1/*.gz $DIR_2/*.gz $DIR_3/*.gz $DIR_4/*.gz $DIR_5/*.gz $DIR_6/*.gz $DIR_7/*.gz $DIR_8/*.gz $BACKUP_DIR/"$TODAY"/

for i in $(find $SOME_FILE/*.zip -mtime +30)
        do
			echo "Moving files to $i..."
			mv "$i" $SOME_FILE_BACKUP
        done
	
echo "Removing folders/files older than 6 months..."

find $BACKUP_DIR/ -mtime +180 -exec rm -fr {} \;
find $SOME_FILE_BACKUP/ -mtime +180 -exec rm -fr {} \;

echo "All done!"

