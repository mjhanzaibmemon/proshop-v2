export PATH=$PATH:/home/ec2-user/.nvm/versions/node/v20.11.1/bin/

cd /Proshop
pm2 start npm -- start
