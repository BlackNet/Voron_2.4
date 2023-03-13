# Update files
cd ~/fluidd
rm -R ./*
rm .version
wget -q -O fluidd.zip https://github.com/fluidd-core/fluidd/releases/latest/download/fluidd.zip
unzip -o fluidd.zip
rm fluidd.zip

# Restart services
sudo service nginx restart

