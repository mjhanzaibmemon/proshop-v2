if /home/ec2-user/.nvm/versions/node/v20.11.1/bin/pm2 list | grep -q "online"; then
    echo "Deleting all pm2 processes."
    /home/ec2-user/.nvm/versions/node/v20.11.1/bin/pm2 delete all
else
    echo "No processes found to stop."
fi
