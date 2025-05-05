# 04 - Linux System Managment
## Excersises

### Users 
Variables: $FILE='/home/catest2/firerod'

1. Create a user *catest1* with **bash** shell and a default home directory.
2. Create a user *catest2* with **sh** shell and a default home directory.
3. Create a user *catest3* with **zsh** shell and a default home directory.
4. **Add** user *catest1* to *docker* group
5. Create a file *$FILE* with `echo "This is my HomeFile!"`
6. Add user catest3 to a *catest2* group
7. Using user *catest3* `cat` *$FILE* file contents.
8. Using user *catest1* `cat` *$FILE* file contents.
9. Restrict read/write permissions on *$FILE* to *others*
10. Grant execute permissions on *$FILE* only to owner. 
- Try executing the file with *catest1*, *catest2*, *catest3*
11. Grant execute permissions on *$FILE* to group.
- Try executing the file with *catest1*, *catest2*, *catest3*
12. Grant execute permissions on *$FILE* to everybody.
- Try executing the file with *catest1*, *catest2*, *catest3*
13. Change the owner of *$FILE* to user=catest1 and group=catest3
- Try executing the file with *catest1*, *catest2*, *catest3*

### su / sudo 
1. Switch users *catest1* -> *catest2*. 
- Create a file in */home/catest2/*
- Create a file in */home/catest1/*
2. Add user *catest1* to sudoers list. 
3. Update packages repository using *catest1* user.
4. Install a package using *catest1* user. 
5. Switch user to *catest2*
- Create a file /etc/newconfig.sh
6. Switch user to *catest1*
- Create a file /etc/newconfig.sh


### Utilities
#### Ping
1. Send 5 packets to google.com 
2. Send 5 packets to homeaffairs.gov.au
3. Send 5 packets to japan.go.jp
4. Send 5 packets to thisisanotherme.me
5. compare the avarage response time

#### traceroute
1. traceroute to google.com 
2. traceroute to homeaffairs.gov.au
3. traceroute to japan.go.jp
4. Compare results. 
- Time between hoops
- Number of hoops

#### netstat
1. List connections
2. List listening connection
3. List PIDs to the listening connections  

#### ifconfig
**NOTICE**: Run networking stuff in containers for safety reasons
1. List all network interfaces
2. Display info only about the *eth0* interface
3. Bring *eth0* interface down. 
4. Ping the *eth0* ip from outside the host it is on (if you're doing the excersis in WSL try pinging the IP from windows terminal)
5. Ping google.com amazom.com linux.org
5. Bring the *eth0* interface up.
6. Set a new IP for *eth0* 
7. Try No.4 on the old ip and new. 

#### ssh 
1. Run 3 containers(ex. ubuntu) and enable ssh 
- `apt update && apt install  openssh-server sudo -y`
- `useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test`
- `echo 'test:test' | chpasswd`
- `service ssh start`
2. Connect to the container using ssh 
3. create a file in the container using ssh 
4. list the contents of home directory on the container using ssh.

#### iptables
Run iptables in docker containers created in previous section. 

1. Get the IPs assosiated with container names. 
2. On *container1* block ssh access from *container2* 
3. Try ssh *container2* -> *container1*.
4. Try ssh *container3* -> *container1*.
5. List *iptables* rules in *container1*.
6. Delete the block rule. 
7. Try ssh *container2* -> *container1*.

#### 
Run iptables in docker containers created in previous section. 

1. Run same scenarios as in previous section.