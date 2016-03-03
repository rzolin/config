

DIR_ROOT="/Users/rzolin/Testing" 
DIR_ANDROID="${DIR_ROOT}/Android"
DIR_CLIENT_SDK="${DIR_ROOT}/armortext-java-client-sdk"

cd $DIR_CLIENT_SDK
git checkout develop
git reset --hard HEAD 
git pull
mvn clean install

cd $DIR_ANDROID
git checkout develop
git reset --hard HEAD 
git pull
gradle clean build