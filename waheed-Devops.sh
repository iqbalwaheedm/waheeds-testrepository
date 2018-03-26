
#!/bin/bash
# execute item 1 - Make a bash script that uses the AWS CLI to launch an Ubuntu 16.04 EC2 instance.
aws ec2 run-instances –-image-id ami-965e6bf3 --count 1 --instance-type t2.micro --key-name waheedkeypair --security-group-ids sg-35fe3840
sleep 15m

# execute item 2 - after the EC2 instance launches, execute a remote command on the EC2 instance to install operating system updates
ec2-metadata --instance-id
aws ssm send-command --document-name "AWS-RunShellScript" --comment "listing services" --instance-ids "Instance-ID" --region us-east-1
sudo apt update && sudo apt dist-upgrade
sudo apt install update-manager-core
do-release-upgrade

# execute item 3 - Once complete, execute a remote command on the EC2 instance to install Apache.
ec2-metadata --instance-id
aws ssm send-command --document-name "AWS-RunShellScript" --comment "listing services" --instance-ids "Instance-ID" --region us-east-1sudo apt-get install apache
sudo reboot

# execute item 4 - Once complete, set Apache's index.html file to display the text "Hello, World!"
rm /var/www/index.html
nano /var/www/index
#!/bin/bash
echo "Hello, World!"
Ctrl +O
Ctrl +X
bash /var/www/chmod +x index
./index
