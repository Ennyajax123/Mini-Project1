#!/bin/bash
sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
<<<<<<< HEAD
sudo dnf install mysql-community-server -y --nogpgcheck
=======
sudo dnf install mysql-community-server -y --nogpgcheck 
>>>>>>> 78e9654b6043f84e83356a05f9eaca2393eede72
