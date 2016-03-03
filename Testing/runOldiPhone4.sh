

DIR_ROOT="/Users/rzolin/Testing" 
DIR_IOS="${DIR_ROOT}/IOS"
DIR_MESSENGER="${DIR_IOS}/Messenger"
DIR_SDK="${DIR_IOS}/SDK"
DIR_OUTPUT="${DIR_ROOT}/Build"

DEST="name=MZ iPhone"

rm -rf $DIR_OUTPUT

cd $DIR_SDK

git checkout develop
git reset --hard HEAD 
git pull

cd $DIR_MESSENGER

git checkout develop
git reset --hard HEAD 
git pull
pod install

mkdir -p ${DIR_OUTPUT}

xcodebuild clean -workspace ArmorText.xcworkspace -scheme ArmorText
# ipa build --workspace ArmorText.xcworkspace --scheme ArmorText --trace

# xcodebuild clean -workspace ArmorText.xcworkspace -scheme ArmorText -destination "generic/platform=iOS,${DEST}" CONFIGURATION_BUILD_DIR="${DIR_OUTPUT}"
xcodebuild -workspace "ArmorText.xcworkspace" \
    -scheme "ArmorText" \
    -sdk iphoneos \
    -configuration AdHoc \
    PRODUCT_NAME="ArmorText Preview" 
    # CONFIGURATION_BUILD_DIR="Build"

    # PROVISIONING_PROFILE="${PROFILE_UUID}" \
    # CODE_SIGN_IDENTITY="${CERTIFICATE_UUID}" \
    # OTHER_CODE_SIGN_FLAGS="--keychain ${KEYCHAIN_NAME}" \

ios-deploy --justlaunch --debug --bundle "ArmorText Preview.ipa"
