#! /bin/bash

if [ -z "$1" ]
then
    echo "Please specify iOS and device version, e.g. 8.1 'iPhone 5'"
    exit 1
fi

if [ -z "$2" ]
then
    echo "Please specify device, e.g. 8.1 'iPhone '"
    exit 1
fi




DIR_ROOT="/Users/rzolin/Testing" 
DIR_IOS="${DIR_ROOT}/IOS"
DIR_MESSENGER="${DIR_IOS}/Messenger"
DIR_SDK="${DIR_IOS}/SDK"
DIR_OUTPUT="${DIR_ROOT}/Build"

IOS=$1
DEVICE=$2
CONFIG="${DEVICE} (${IOS} Simulator)"
DEST="platform=iOS Simulator,name=${DEVICE},OS=${IOS}"

DEVICE_ID=`xcrun simctl list devices | awk -f devices.awk | awk -v pattern=".*${IOS}.*${DEVICE} .*" '$0 ~ pattern { print substr($8, 2, length($8) - 2)  }'`
echo "Device ID: ${DEVICE_ID}"

if [ "$DEVICE_ID" = "" ]
then
	echo "Unsupported config. Possible configurations:"
	xcrun simctl list devices | awk -f devices.awk | awk '{ print $3 ", " $6 " " $7 }'
	exit 1
fi

echo "Destination: ${DEST}"
echo "Working dir: ${DIR_MESSENGER}"

cd $DIR_MESSENGER
rm -rf $DIR_OUTPUT

git checkout develop
git reset --hard HEAD 
git pull
pod install

mkdir -p ${DIR_OUTPUT}

xcodebuild clean -workspace ArmorText.xcworkspace -scheme ArmorText -destination "${DEST}" CONFIGURATION_BUILD_DIR="${DIR_OUTPUT}"
xcodebuild build -workspace ArmorText.xcworkspace -scheme ArmorText -destination "${DEST}" CONFIGURATION_BUILD_DIR="${DIR_OUTPUT}"

xcrun instruments -w "${DEVICE_ID}"
open -a "iOS Simulator" --args -CurrentDeviceUDID UDID-of-device
xcrun simctl install booted $DIR_OUTPUT/ArmorText\ Preview.app
xcrun simctl launch booted co.armortext.messenger.preview
