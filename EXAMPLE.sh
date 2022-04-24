#!/bin/bash

# VARIABLES Y FUNCONES
DIR_HOME=$(cd `dirname $0` && pwd)
source "${DIR_HOME}/scripts/commonFunctions.sh"
SCRIPT_NAME=`getJustStriptName $0`
export LOG_FILE="current_log"

declare -A script_info
export script_info=(
	[name]="${SCRIPT_NAME}" 
	[location]="${DIR_HOME}" 
	[description]="My large description" 
	[calling]="./`getStriptName $0` yyyymmdd"
)

showScriptInfo

month=$((`date +%m`))
year=$((`date +%Y`))

if [ "`isDateAndMonthRigth $year $month`" == "True" ] ; then
	getAllDatesOfOneMonth $year $month
else
	echo "ERROR"
	# Write an error in a LOG_FILE
	showError 1 "My error test check"
fi