# load secrets before start
SECRET_JSON=$(aws secretsmanager get-secret-value --secret-id SecretKeyManager --query SecretString --output text)
echo "$SECRET_JSON" | jq -r "to_entries|map(\"\(.key | ascii_upcase)=\(.value | tostring)\")|.[]" > /Proshop/.env


# start server
export PATH=$PATH:/home/jhezi/.nvm/versions/node/v20.11.1/bin/  
cd /Proshop
pm2 start npm -- start
