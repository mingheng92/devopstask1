#!/bin/bash

# Enter the directory path of count.sh
read -p "Enter the directory path of count.sh: " script_dir

# Enter the directory path of apache log file
read -p "Enter the directory path of apache log file name: " logfile_dir

# To set the cronjob
(crontab -l ; echo "0 * * * * $script_dir $logfile_dir") | crontab -

#To ensure the cron service is running
sudo service cron restart