#!/bin/bash

outputpath=~/research/sys_info.txt

if [ ! -d ~/research ]
then
	mkdir ~/research
fi

if [ -f $outputpath ]
then
	rm $outputpath
fi

files=('/etc/passwd' '/etc/shadow')

# Print out the top 10 processes by memory
echo "A Quick System Audit Script" >$outputpath
date >>$outputpath
echo "" >>$outputpath
echo "Machine Type Info:" >>$outputpath
echo $MACHTYPE >>$outputpath
echo -e "Uname info: $(uname -a) \n" >>$outputpath
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >>$outputpath
echo -e "Hostname: $(hostname -s) \n" >>$outputpath
echo "DNS Servers: " >>$outputpath
cat /etc/resolv.conf >>$outputpath
echo -e "\nMemory Info:" >>$outputpath
free >>$outputpath
echo -e "\nCPU Info:" >>$outputpath
lscpu | grep CPU >>$outputpath
echo -e "\nDisk Usage:" >>$outputpath
df -H | head -2 >>$outputpath
echo -e "\nWho is logged in: \n $(who -a) \n" >>$outputpath
echo -e "\nExec Files:" >>$outputpath
find /home -type f -perm 777 >>$outputpath
echo -e "\nTop 10 Processes" >>$outputpath
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>$outputpath

# Print out perms of the files in files list variable
for file in ${files[@]}
do
	ls -l $file >> $outputpath
done


