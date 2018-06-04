Assignment 4

TASK 1 :- Setup a lamp server and host a wordpress site on your local system Note: Don't install php directly using yum or apt-get
compile it from source using PREFIX with /usr/local/php directory :-
a) Install Apache2
# sudo apt-get update
# sudo apt-get install apache2
b) Configure Apach2
# sudo apache2ctl configtest
# sudo nano /etc/apache2/apache2.conf
# ServerName 192.168.33.10
# sudo apache2ctl configtest
# sudo systemctl restart apache2
http://192.168.33.10

c) Install mysql
# sudo apt-get install mysql-server
# sudo apt-get install php libapache2-mod-php php-mcrypt php-# mysql








d) Configure the file
# sudo nano /etc/apache2/mods-enabled/dir.conf
 <IfModule mod_dir.c>
     DirectoryIndex index.html index.cgi index.pl index.php # index.xhtml index.htm
</IfModule>
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
# sudo systemctl restart apache2
# sudo systemctl status apache2


e) Configure this file
# sudo nano /var/www/html/info.php
<!DOCTYPE html>
<html>
<body>
<h1>My first PHP page</h1>
<?php
echo "Hello World!";
?> 
</body>
</html>
f) Check on your local host
http://192.168.33.10/info.php

g) Create database and Grant the local host
# mysql -u root -p
mysql> CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
mysql> GRANT ALL ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'rhel08';
mysql> FLUSH PRIVILEGES;
mysql> EXIT;





h) Install Additional PHP Extensions
# sudo apt-get update
# sudo apt-get install php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc
# sudo systemctl restart apache2


i) Adjust Apache's Configuration to Allow for .htaccess Overrides and Rewrites
# sudo nano /etc/apache2/apache2.conf
<Directory /var/www/html/>
    AllowOverride All
</Directory>
Enable the Rewrite Module
# sudo a2enmod rewrite
Enable the Changes
# sudo apache2ctl configtest
# sudo systemctl restart apache2


j) Download WordPress
# cd /tmp
# curl -O https://wordpress.org/latest.tar.gz
# tar xzvf latest.tar.gz
# touch /tmp/wordpress/.htaccess
# chmod 660 /tmp/wordpress/.htaccess
# cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-# config.php
# mkdir /tmp/wordpress/wp-content/upgrade
# sudo cp -a /tmp/wordpress/. /var/www/html

k) Configure the WordPress Directory
# sudo chown -R root:www-data /var/www/html
# sudo find /var/www/html -type d -exec chmod g+s {} \;
# sudo chmod g+w /var/www/html/wp-content
# sudo chmod -R g+w /var/www/html/wp-content/themes
# sudo chmod -R g+w /var/www/html/wp-content/plugins
l) Setting up the WordPress Configuration File
# curl -s https://api.wordpress.org/secret-key/1.1/salt/
paste the output in:-
# nano /var/www/html/wp-config.php

m) Configure the changes
# sudo vi /var/www/html/wp-config.php
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'localhost');

/** MySQL database password */
define('DB_PASSWORD', 'rhel08');

. . .

define('FS_METHOD', 'direct');

n) Complete the Installation Through the Web Interface
http://192.168.33.10

Select the language you would like to use:
Next, you will come to the main setup page.
(NOTE:- Still working on second problem.)


