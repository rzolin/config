

DIR_ROOT="/Users/rzolin/Testing" 
DIR_IOS="${DIR_ROOT}/IOS"
DIR_MESSENGER="${DIR_IOS}/Messenger"
DIR_SDK="${DIR_IOS}/SDK"
DIR_OUTPUT="${DIR_ROOT}/Build"

APP_NAME="ArmorText Preview"
APP_FILE="${APP_NAME}.app"
APP_PATH="${DIR_OUTPUT}/${APP_FILE}"

SCHEME="ArmorText"
PROJECT_NAME="ArmorText"

DEST="name=MZ iPhone"

cd $DIR_MESSENGER
rm -rf $DIR_OUTPUT

git checkout develop
git reset --hard HEAD 
git pull
pod install
