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

###
# Resizable iPad (8.1 Simulator) [44AF64EB-1487-47A4-9111-52DE3C30918B]
# Resizable iPhone (8.1 Simulator) [9E9AAF30-9106-4FC1-BDD2-226159F8BA1C]
# iPad 2 (8.1 Simulator) [05F02D06-7D95-42F1-844E-830070FDF494]
# iPad Air (8.1 Simulator) [BC5DFFFA-5E36-4AD3-B6CE-05AA9930BAEF]
# iPad Retina (8.1 Simulator) [41D63F70-8665-40D0-81C4-74B96FDA9B5F]
# iPhone 4s (8.1 Simulator) [6BCD3285-4A35-4433-9A64-CD2AE23F8261]
# iPhone 5 (8.1 Simulator) [27991C14-49DF-430D-82BA-352F9BA2C92C]
# iPhone 5s (8.1 Simulator) [0ACCE826-0CF2-4CC7-97FB-20D899313DE5]
# iPhone 6 (8.1 Simulator) [7274F54D-B9CF-40F4-B30D-2365A4C53519]
###