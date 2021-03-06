#!/bin/sh

# NodeManager runs on port 5556

ms1="host1"
ms2="host2"
ms3="host3"
ms4="host4"

echo -e "\e[1;33m=================================================================\033[m"
echo -e "\e[1;33mNow let's START NodeManager on all the server(s) in the domain...\033[m"
echo -e "\e[1;33m=================================================================\033[m"
sleep 2

echo ""
echo -e "\033[32m=================\033[m"
echo -e "\033[32m== AdminServer ==\033[m"
echo -e "\033[32m=================\033[m"
echo ""
echo -e "\033[32mStarting NodeManager...\033[m"
cd /thirdparty/Oracle/weblogic/wlserver_10.3/server/bin;./startNodeManager.sh &

sleep 2
echo ""
echo -e "\033[32m======================\033[m"
echo -e "\033[32m== Managed Server 1 ==\033[m"
echo -e "\033[32m======================\033[m"
echo ""
echo -e "\033[32mStarting NodeManager...\033[m"
ssh $ms1 "cd /thirdparty/Oracle/weblogic/wlserver_10.3/server/bin;nohup ./startNodeManager.sh > nodemanger.out 2> nodemanger.err &"

sleep 2
echo ""
echo -e "\033[32m======================\033[m"
echo -e "\033[32m== Managed Server 2 ==\033[m"
echo -e "\033[32m======================\033[m"
echo ""
echo -e "\033[32mStarting NodeManager...\033[m"
ssh $ms2 "cd /thirdparty/Oracle/weblogic/wlserver_10.3/server/bin;nohup ./startNodeManager.sh > nodemanger.out 2> nodemanger.err &"

sleep 2
echo ""
echo -e "\033[32m======================\033[m"
echo -e "\033[32m== Managed Server 3 ==\033[m"
echo -e "\033[32m======================\033[m"
echo ""
echo -e "\033[32mStarting NodeManager...\033[m"
ssh $ms3 "cd /thirdparty/Oracle/weblogic/wlserver_10.3/server/bin;nohup ./startNodeManager.sh > nodemanger.out 2> nodemanger.err &"

sleep 2
echo ""
echo -e "\033[32m======================\033[m"
echo -e "\033[32m== Managed Server 4 ==\033[m"
echo -e "\033[32m======================\033[m"
echo ""
echo -e "\033[32mStarting NodeManager...\033[m"
ssh $ms4 "cd /thirdparty/Oracle/weblogic/wlserver_10.3/server/bin;nohup ./startNodeManager.sh > nodemanger.out 2> nodemanger.err &"

echo ""
echo -e "\033[32m=======================================================\033[m"
echo -e "\033[32mLet's wait for 2 minutes until NodeManager starts up...\033[m"
echo -e "\033[32m=======================================================\033[m"
echo ""

sleep 120
echo ""
echo -e "\033[32m==================================================================================\033[m"
echo -e "\033[32mNow let's verify that NodeManager is running on all the server(s) in the domain...\033[m"
echo -e "\033[32m==================================================================================\033[m"
echo ""

echo -e "\e[1;31mAdminServer...\033[m"
echo ""
ps ax | grep 'weblogic.NodeManager' | grep -v grep | grep java
netstat -an |grep 5556
echo -e "\e[1;33m==================================================================================\033[m"
echo ""

echo -e "\e[1;31mManaged Server 1...\033[m"
echo ""
ssh $ms1 "ps ax | grep 'weblogic.NodeManager' | grep -v grep | grep java"
ssh $ms1 "netstat -an |grep 5556"
echo -e "\e[1;33m==================================================================================\033[m"
echo ""

echo -e "\e[1;31mManaged Server 2...\033[m"
echo ""
ssh $ms2 "ps ax | grep 'weblogic.NodeManager' | grep -v grep | grep java"
ssh $ms2 "netstat -an |grep 5556"
echo -e "\e[1;33m==================================================================================\033[m"
echo ""

echo -e "\e[1;31mManaged Server 3...\033[m"
echo ""
ssh $ms3 "ps ax | grep 'weblogic.NodeManager' | grep -v grep | grep java"
ssh $ms3 "netstat -an |grep 5556"
echo -e "\e[1;33m==================================================================================\033[m"
echo ""

echo -e "\e[1;31mManaged Server 4...\033[m"
echo ""
ssh $ms4 "ps ax | grep 'weblogic.NodeManager' | grep -v grep | grep java"
ssh $ms4 "netstat -an |grep 5556"
echo -e "\e[1;33m==================================================================================\033[m"
echo ""

exit 0
