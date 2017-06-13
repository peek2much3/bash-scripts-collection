#!/bin/bash


dt=$(date '+%m/%d/%Y %H:%M:%S');

echo ""
echo "======================"
echo $dt
echo "======================"
echo ""

HOST=destination
PORT=22
USER=user
SOURCE_DIR=/SOME_DIR/SOME_DIR_1/
SOURCE_FILE=/SOME_DIR/SOME_DIR_1/FILE*
TARGET_DIR=/SOME_DIR/SOME_DIR/

/usr/bin/expect<<EOD

spawn /usr/bin/sftp -o Port=$PORT $USER@$HOST
expect "sftp>"
send "mput $SOURCE_FILE $TARGET_DIR\r"
expect "sftp>"
send "bye\r"
EOD

gzip -9 $SOURCE_DIR/FILE*

mv $SOURCE_DIR/*.gz $SOURCE_DIR/backup/

find $SOURCE_DIR/backup/ -mtime +30 -exec rm -f {} \;
