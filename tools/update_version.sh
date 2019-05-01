#!/bin/bash
# Update The Software Version From Online

# Get The Versions Of The Software
SITE_VERSION=$(curl -s https://github.com/gohugoio/hugo/releases/latest |  grep -Eo "[0-9]{1,2}\.[0-9]{1,2}.[0-9]{1,2}")
LOCAL_VERSION=$(grep "finalImageVersion" container.conf | cut -d= -f 2)

# Check Versions And Update File
if [ "$SITE_VERSION" != "$LOCAL_VERSION" ]
then
  sed -i "s/^finalImageVersion=.*/finalImageVersion=${SITE_VERSION}/" container.conf
  echo " Version Updated."
else
  echo " No Version Change."
fi
