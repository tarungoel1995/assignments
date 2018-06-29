#!/bin/bash

var="$(aws ec2 describe-instances --filter Name=tag:boot-order,Values=3 | grep InstanceId | awk '{print $2}' | sed 's/"//g' | sed 's/,//g')"
echo $var
aws ec2 start-instances --instance-ids $var
status="$(aws ec2 describe-instance-status --instance-ids $var | grep Code | awk '{print $2}')"
echo $status
while [ "$status" !=  "16" ]
do
  echo $status
  sleep 20
status="$(aws ec2 describe-instance-status --instance-ids $var | grep Code | awk '{print $2}')"
done


var="$(aws ec2 describe-instances --filter Name=tag:boot-order,Values=2 | grep InstanceId | awk '{print $2}' | sed 's/"//g' | sed 's/,//g')"
echo $var
aws ec2 start-instances --instance-ids $var
status="$(aws ec2 describe-instance-status --instance-ids $var | grep Code | awk '{print $2}')"
echo $status
while [ "$status" !=  "16" ]
do
  echo $status
  sleep 20
status="$(aws ec2 describe-instance-status --instance-ids $var | grep Code | awk '{print $2}')"
done

var="$(aws ec2 describe-instances --filter Name=tag:boot-order,Values=1 | grep InstanceId | awk '{print $2}' | sed 's/"//g' | sed 's/,//g')"
echo $var
aws ec2 start-instances --instance-ids $var
status="$(aws ec2 describe-instance-status --instance-ids $var | grep Code | awk '{print $2}')"
while [ "$status" !=  "16" ]
do
  echo $status
  sleep 20
status="$(aws ec2 describe-instance-status --instance-ids $var | grep Code | awk '{print $2}')"
done
