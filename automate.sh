#!/bin/bash

echo $?
# Step 1: Open cellular connection
# Step 2: Create/Set directory where photos should be saved



# Step 8: Close Cellular connection


##########	Starts PPP session (Creates cellular connection)
#sudo hologram network connect -v

# Variables
user_id="195757"

#Export variables so that they can be used in the hook script
export user_id
export backup_dir

# Create directory based on todays date Ex) 20190315 - Year+Month+Day
backup_dir=$(date +'%Y%m%d')
echo "Creating directory....... ${user_id}/${backup_dir}"
mkdir -p "${user_id}"/"${backup_dir}"

# Change directory to newly created directory. This will be where all the images will be saved to. 
cd $user_id/$backup_dir


# Configure AWS access
#aws configure set region us-east-2
#aws configure set aws_access_key_id AKIAI5JPTEATNX3RWIGQ
#aws configure set aws_secret_access_key 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

# Use the s3 mb command to create a bucket. Bucket names must be globally unique and 
# should be DNS compliant. Bucket names can contain lowercase letters, numbers, hyphens, and periods. 
# Bucket names can start and end only with a letter or number, and cannot contain a 
# period next to a hyphen or another period

# Create bucket for user_id
#/home/pi/.local/bin/aws s3 mb s3://"${user_id}"
#/home/pi/.local/bin/aws s3api put-object --bucket "${user_id}" --key "${backup_dir}"/
# This operation is useful to determine if a bucket exists and you have permission to access it.
if /home/pi/.local/bin/aws s3api head-bucket --bucket "$user_id" 2>/dev/null; 
then
    echo "Bucket has been verifed and exists"
else
    /home/pi/.local/bin/aws s3 mb s3://"${user_id}"
    /home/pi/.local/bin/aws s3api put-object --bucket "${user_id}" --key "${backup_dir}"/
fi


# Detect Camera model and port
gphoto2 --auto-detect

# Begin Tethered Capture using ghoto2 cli
# Make sure that hook script is executable and has correct permissions set
# Ex) chmod u+x upload.sh

#All that is left is to tie it all up, and get gphoto to give the images
#timestamped names rather than sequential numbers.  
#If you use the default filename you must remember to change folders 
#before running the scripts again or you will clobber the existing files!


#gphoto2 --capture-tethered --debug --debug-logfile=my-logfile.txt --force-overwrite --hook-script=/home/pi/scripts/upload.sh --filename TET_%H%M%S.%C
gphoto2 --capture-tethered --debug --debug-logfile=my-logfile.txt --force-overwrite --hook-script=/home/pi/scripts/upload.sh --filename TET_%H%M%S.%C
#( speaker-test -t sine -f 1000 )& pid=$! ; sleep 5s ; kill -9 $pid

echo $?



#Checks for existing PPP sessions then issues kill command based on the pid
#sudo hologram network disconnect




