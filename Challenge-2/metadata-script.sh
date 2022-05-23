#!/bin/bash

########################  PREREQUISITE  ##################################
#									 #
#  Keep private key in a file called my-private-key.pem                  #
#									 #
#  Pass the AWS instance IP as an argument while running this script     #
# 									 # 
#  User has to Select the metadata key when prompted			 #
##########################################################################


IP=`echo $1`
echo -e "\n ami-id ami-launch-index ami-manifest-path block-device-mapping events hibernation hostname iam identity-credentials instance-action instance-id instance-life-cycle instance-type local-hostname local-ipv5 mac metrics network placement profile public-keys reservation-id security-groups \n"

read -p "Please enter your option for above metadata key: `echo $'\n> '`" key
echo "Fetching metadata for instance IP -> $IP and key is $key"

ssh -i my-private-key.pem ec2-user@$IP "TOKEN=`curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -s -H "X-aws-ec2-metadata-token: $TOKEN"  http://169.254.169.254/latest/meta-data/$key "
echo ""

