

DIR_ROOT="/Users/rzolin/Testing" 
DIR_ANDROID="${DIR_ROOT}/Android"
DIR_CLIENT_SDK="${DIR_ROOT}/armortext-java-client-sdk"

open /Applications/Genymotion.app

cd $DIR_CLIENT_SDK
git checkout develop
git reset --hard HEAD 
git pull
mvn clean install

cd $DIR_ANDROID
rm -rf armortext-android-messenger-app/build

git checkout develop
git reset --hard HEAD 
git pull

rm -rf armortext-android-demo-app
gradle clean installProdDebug
adb -e install -r armortext-android-messenger-app/build/outputs/apk/armortext-android-messenger-app-dev-debug-unaligned.apk
adb -e shell am start -n co.armortext.messenger/co.armortext.android.messenger.signup.LoginActivity