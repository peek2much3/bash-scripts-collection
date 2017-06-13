#! /bin/sh

# Check WL status - requires password at each prompt

echo ""
echo " ------------------------------------------------------------------------------- "
echo "|                    WL  ENVIROMENT HEALTH STATUS REPORT                        |"
echo " ------------------------------------------------------------------------------- "
echo ""
curl -u weblogic -H Accept:application/json http://localhost:7001/management/tenant-monitoring/servers | jq '.'
echo ""
echo " -------------------------------------------------------------------------------"
echo "|                        APPLICATION HEALTH STATUS                              |"
echo " ------------------------------------------------------------------------------- "
echo ""
curl -u weblogic -H Accept:application/json http://localhost:7001/management/tenant-monitoring/applications | jq '.'
echo ""
echo " -------------------------------------------------------------------------------"
echo "|                       DATA SOURCES HEALTH STATUS                              |"
echo " ------------------------------------------------------------------------------- "
echo ""
curl -u weblogic -H Accept:application/json http://localhost:7001/management/tenant-monitoring/datasources/DATA-SOURCE | jq '.'
echo ""

