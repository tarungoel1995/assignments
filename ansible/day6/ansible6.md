Assignment 6 Ansible

Assignment
Create an Ansible playbook to rotate ssh keys. Explaination - Replacing the keys you’re currently using with new keys, and removing the ability for old keys to be used to log into your systems.

1. Create a new key 
	#ssh-keygen -t rsa
	#cat id_rsa.pub (copy the public key and paste it into the auhtorized_keys of user)

2. Add new key to authorized_keys files on your nodes
#go to the nodes and perform following actions
#cd /path to the home directory of user/.ssh
#vim authorized_keys (paste the public key here , copied from above step)

3. Test new key
#ssh username@ipaddress  

4. Remove previous keys from authorized_keys files on your nodes.
Added ip of nodes into inventory file and was able to ping the nodes using following command
#ansible all -m ping
#ssh-keygen -t rsa 
#Enter file in which to save the key: /root/.ssh/id_rsa1
#Your public key has been saved in /root/.ssh/id_rsa1.pub
#written the playbook to rotate the new public keys in the authorized_keys of all nodes.
Link: https://github.com/tarungoel1995/assignments/blob/master/ansible/day6/rotatingpublickeys.yml
Output: ![Rotating keys] (https://github.com/tarungoel1995/assignments/blob/master/ansible/day6/rotatingpublickeys.png)

5. again test the connectivity with the new keys. 
Output Link: ![ssh with new keys] (https://github.com/tarungoel1995/assignments/blob/master/ansible/day6/loginwithnewkey.png)
	
