#!/bin/bash


#cyan='\e[0;36m'
#okgreen='\033[92m'
#red='\e[1;31m'

function checkService1()
{
 ps auxw | grep -P '\b'$1'(?!-)\b' >/dev/null
 if [ $? != 0 ]
 then
   echo -e "\e[1;31m[FAIL]\033[m Service1 is not running!";
 else
   echo -e "\033[92m[PASS]\033[m Service1 is running!";
 fi;
}

function Service2()
{
 ps auxw | grep -P '\b'$1'(?!-)\b' >/dev/null
 if [ $? != 0 ]
 then
   echo -e "\e[1;31m[FAIL]\033[m Service2 is not running!";
 else
   echo -e "\033[92m[PASS]\033[m Service2 is running!";
 fi;
}

function Service3()
{
 ps auxw | grep -P '\b'$1'(?!-)\b' >/dev/null
 if [ $? != 0 ]
 then
   echo -e "\e[1;31m[FAIL]\033[m Service3 is not running!";
 else
   echo -e "\033[92m[PASS]\033[m Service3 is running!";
 fi;
}

function Service4()
{
 ps auxw | grep -P '\b'$1'(?!-)\b' >/dev/null
 if [ $? != 0 ]
 then
   echo -e "\e[1;31m[FAIL]\033[m Service4 is not running!";
 else
   echo -e "\033[92m[PASS]\033[m Service4 is running!";
 fi;
}

function Service5()
{
 ps auxw | grep -P '\b'$1'(?!-)\b' >/dev/null
 if [ $? != 0 ]
 then
   echo -e "\e[1;31m[FAIL]\033[m Service5 is not running!";
 else
   echo -e "\033[92m[PASS]\033[m Service5 is running!";
 fi;
}

echo -e "\e[1;33m ________________________\033[m"
echo -e "\e[1;33m[SERVICE STATUS CHECKS...]\033[m"

echo "--------------------------------------"
checkService1 "Service1"
sleep 2
echo "--------------------------------------"
Service2 "Service2"
sleep 2
echo "--------------------------------------"
Service3 "Service3"
sleep 2
echo "--------------------------------------"
Service5 "Service4"
echo "--------------------------------------"
Service4 "Service5"
echo "--------------------------------------"