cd ~/mainsail
rm -R ./*
wget -q -O mainsail.zip https://github.com/mainsail-crew/mainsail/releases/latest/download/mainsail.zip
unzip -o mainsail.zip
rm mainsail.zip

# Restart services
sudo service nginx restart