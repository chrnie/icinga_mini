#!/bin/bash

##                  ##
#   some functions   #
##                  ##

usage() {
echo "This plugin returns fake states for general and report testing purposes"
echo "$0 <before_OK, INT, HOUR OF DAY> <before_WARN, INT, HOUR OF DAY>"
}
not_a_number() {
  echo "error: Not a number" >&2;
  usage
  exit 3
}
check_params() {
  case $1 in
    ''|*[!0-9]*) not_a_number ;;
  esac
  case $2 in
    ''|*[!0-9]*) not_a_number ;;
  esac
}

##             ##
#  check vars   #
##             ##

check_params $1 $2

##             ##
#  check time   #
##             ##

HOUR=`date +%H`

if [ "$HOUR" -lt $1 ]
  then
  echo -n "OK - Service is in Time"
  EXIT=0
elif [ "$HOUR" -lt $2 ]
  then
  echo -n "Warning - Service is in Lunchtime"
  EXIT=1
else 
  echo -n "Critical - Service is out of Time"
  EXIT=2
fi

##       ##
#  exit   #
##       ##
# perfdata format:  'label'=value[UOM];[warn];[crit];[min];[max]
echo " | 'hour'=$HOUR;$1;$2;0;24"

exit $EXIT
