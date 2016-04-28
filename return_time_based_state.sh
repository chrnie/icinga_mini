#!/bin/bash

HOUR=`date +%H`

if [ "$HOUR" -lt 12 ]
  then
  echo -n "OK - Service is in Time"
  EXIT=0
elif [ "$HOUR" -lt 13 ]
  then
  echo -n "Warning - Service is in Lunchtime"
  EXIT=1
else 
  echo -n "Critical - Service is out of Time"
  echo "no"
  EXIT=2
fi


# perfdata format:  'label'=value[UOM];[warn];[crit];[min];[max]
echo " | 'hour'=$HOUR;12;13;0;24"

exit $EXIT
