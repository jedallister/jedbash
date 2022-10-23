#!/bin/bash
#This script allows you to migrate files via lftp utility. Make sure it's installed on your server before running the script.

echo -e "\n*** Migration via LFTP ***\n"
echo "ftp or sftp:"
read proto
echo "Port number:"
read port
echo "Enter the source FTP or SFTP host:"
read ftphost
echo "Enter the source FTP or SFTP user:"
read ftpuser
echo "Enter the source FTP or SFTP password:"
read -s ftppass
COMMAND=("lftp" "-u" "'$ftpuser','$ftppass'" "$proto://'$ftphost'" "-p$port" "-e" "set ssl:verify-certificate false")

echo -e "\nPlease copy the mirror command below: \nmirror -cv --parallel=3 --exclude wp-content/cache/ --exclude wp-content/updraft/\n"
echo ${COMMAND[@]}
echo -e "\nDo you want to run lftp now? (y/n)"
read input
if [ "$input" == "yes" ] || [ "$input" == "y" ];
then "${COMMAND[@]}"
fi
