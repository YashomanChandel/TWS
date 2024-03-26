#!/bin/bash

read -p "Enter instance id: " id

state=$(aws ec2 describe-instances --instance-ids $id --query 'Reservations[0].Instances[0].State.Name' --output text)


if [[ $state == "running" ]]; then
	aws ec2 stop-instances --instance-ids $id &> /dev/null
        echo "Stopping the instance"
        state=$(aws ec2 describe-instances --instance-ids $id --query 'Reservations[0].Instances[0].State.Name' --output text)
        echo "current instance state " $state

else
	echo "Instance is not running"
fi

#echo $state

