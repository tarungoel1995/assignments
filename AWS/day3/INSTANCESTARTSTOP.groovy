job('INSTANCESTARTSTOP') {
   parameters
{
  stringParam('StartStop', '')
  stringParam('Instanceid', '')
} 
  steps {
  shell('''
#!/bin/bash
if [ $StartStop = Stop ]
then
aws ec2 stop-instances --instance-ids $Instanceid
elif [ $StartStop = Start ]
then
aws ec2 start-instances --instance-ids $Instanceid
fi
''')
        
        }
}
