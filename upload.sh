#!/bin/bash

#This Script will convert each downloaded file from a .raw
#to a jpeg. 

#echo $ACTION		
#echo $ARGUMENT		#Displays the full filename
#echo ${ARGUMENT##*.} #Displays the file extension
#echo ${ARGUMENT%.*} #Displays only the filename

if [ "$ACTION" = "download" ]; then
		
	#echo $UserID
	#echo $UserID"_"$ARGUMENT #Displays new filename. Concats UserID and Filename
	#mv $ARGUMENT "$UserID"_"$ARGUMENT" #Rename file
	#exiftool -b -JpgFromRaw $ARGUMENT > $ARGUMENT
	
	# This function below will only upload jpgs - 
	#Ex) If extension is a .jpg then upload the photo to AWS S3
	if [ "${ARGUMENT##*.}" = "jpg" ]; then
		echo $ARGUMENT
		echo "Uploading ${ARGUMENT} to ${user_id}/${backup_dir}"
		#uploads file to S3 bucket/folder
		/home/pi/.local/bin/aws s3 cp ${ARGUMENT} s3://"${user_id}"/"${backup_dir}"/${ARGUMENT} 
	fi
	
	#rm $ARGUMENT #delete file afterwards
fi