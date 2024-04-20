#!/bin/bash 

# check if apache is installed and install Apache 

if ! [ -x "$(command -v apache2)" ]; then
    echo "Apache is not installed. Installing..."
    sudo apt update
    sudo apt install apache2 -y
    echo "Apache installed successfully."
else
    echo "Apache is already installed."
fi

#check if mysql is installed and install mysql 

if ! [ -x "$(command -V mysql)" ]; then 
    echo "MySQL is not installed. Installing ..."
    sudo apt install mysql-server -y
    echo "MySQL installed successfully."
else
    echo "MySQL is already installed."
fi

# Check if PHP is installed and install php with mysql package 
if ! [ -x "$(command -v php)" ]; then
    echo "PHP is not installed. Installing..."
    sudo apt install php libapache2-mod-php php-mysql -y
    echo "PHP installed successfully."
else
    echo "PHP is already installed."
fi

# Check if Git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "Git is not installed. Installing..."
    sudo apt install git -y
    echo "Git installed successfully."
fi

# Configure Git
echo "Configuring Git..."
git config --global user.name "seuncaleb"
git config --global user.email "calebibejigba@gmail.com"
echo "Git configured successfully."

# Clone PHP application from GitHub
echo "Cloning PHP application from GitHub..."
git clone https://github.com/laravel/laravel.git php_application
echo "PHP application cloned successfully."

# Configure Apache web server
echo "Configuring Apache web server..."
sudo cp your_application_directory /var/www/html/ -r
sudo chown -R www-data:www-data /var/www/html/php_application
sudo chmod -R 755 /var/www/html/php_application
echo "Apache web server configured successfully."

# Configure MySQL
echo "Configuring MySQL..."
sudo mysql -e "CREATE DATABASE seuncaleb;"
sudo mysql -e "CREATE USER 'seuncaleb'@'localhost' IDENTIFIED BY 'seuncaleb';"
sudo mysql -e "GRANT ALL PRIVILEGES ON seuncaleb.* TO 'seuncaleb'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"
echo "MySQL configured successfully."

# Restart Apache web server
echo "Restarting Apache web server..."
sudo systemctl restart apache2
echo "Apache web server restarted successfully."

echo "PHP application setup complete."
