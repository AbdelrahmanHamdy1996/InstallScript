new_user="Abdo"

echo -e "\n---- Creating a New User ----"
sudo adduser $new_user sudo

echo -e "\n---- Granting Administrative Privileges ----"
sudo usermod -aG sudo $new_user

echo -e "\n---- Setting Up a Basic Firewall ----"
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

echo -e "\n---- Enabling External Access for Your Regular User ----"
sudo rsync --archive --chown=$new_user:$new_user ~/.ssh /home/$new_user
