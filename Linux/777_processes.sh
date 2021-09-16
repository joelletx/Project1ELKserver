#!/bin/bash
sudo find /home -type f -perm 777 > ~/research/sys_info.txt
ps aux | head -11 >> ~/research/sys_info.txt

