if pm2 list | grep -q "online"; then
    echo "Deleting all pm2 processes."
    pm2 delete all
else
    echo "No processes found to stop."
fi
