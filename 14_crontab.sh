# Day 20

crontab -e -> to open crontab editor

* * * * * "Hello world from cron tab"
* * * * * sudo backup /home/ec2-user/applogs /home/ec2-user/destdir

sudo tail -f /var/log/cron -> to check logs