#!/bin/bash

read -p "enter id: " id

aws ec2 stop-instances --instance-ids $id &> /dev/null
echo " Instance stopped"

