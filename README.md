# TASK 1:

## 1.A: BASH SCRIPT (HTTP 4xx and 5xx respose status)
### Requirements:
- Counts the number of HTTP 4xx and 5xx response statuses in the apache log file. The filename would be provided as a parameter to the script
- If the cumulative number of errors exceeds 100, send an email alert reporting on the high number of error responses and relevant information
- The script is expected to be run periodically (e.g. every hour) to check if the threshold for the errors have been met for the period of time.

### Steps to test:
1. Clone this repository to your linux machine
2. Please make sure your linux machine have `postfix and mailutils` installed. You may follow the following reference to install:
- [Setting Up An SMTP Relay On Ubuntu](https://www.linuxfordevices.com/tutorials/ubuntu/smtp-relay-on-ubuntu)
3. Kindly update to **your email** in `count.sh line7`
4. For testing purposes on the cronjob, you may replace line10 in `cron_setup.sh` with the following code:
`(crontab -l ; echo "* * * * * $script_dir $logfile_dir") | crontab -`
5. For `Enter the directory path of count.sh:` Kindly input the path of the count.sh, e.g. `/home/root/count.sh`
6. For `Enter the directory path of apache log file name:` Kindly input the path of the apache log file, e.g. `/home/root/apachelogs`

If the apache log file meet the criteria, you should received the email with the subject "HTTP 4xx/5xx Errors Exceeded 100 times" and an attachment name "HTTP4xx_5xx.log".


## 1.B: 
### QUESTION
As time passes, the log files for your application have piled up, and the machine is running out of storage. Briefly describe how you would resolve this in a short paragraph, taking into considerations that:
1. On rare occasion, logs up to 3 months old are required for troubleshooting/investigations 
2. Audit requirements dictate that logs are to be kept for at least 7 years 
3. The machine is currently storing 6 months worth of logs, and would run out of storage within the week. Increasing storage is not an option within the next 12 months 

### ANSWER
According to the scenarios mentioned, we can consider to leverage on public cloud storage services, such as AWS S3 & S3 Glacier. Since logs up to 3 months old will be occasionally used for troubleshooting/investigation, we can use shell script and aws cli to upload the log files to S3 bucket, and use cronjob to repeat this task monthly. We can consider to use S3 Standard or S3 Standard-IA for 3 months old logs. Then we can set the lifecycle policy to transfer the log file from S3 to S3 Glacier (to be consider Glacier Instant Retrieval or Flexible Retrieval). For logs required to kept for at least 7 years, we can also set lifecycle policy to transfer data to S3 Glacier Deep Archive. With proper lifecycle policy set and automation ready, this will help to reduce the manual efforts to clear log files and saving a lot of costing on storing the log files for audit purpose.