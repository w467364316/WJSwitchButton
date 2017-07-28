# 工程名
APP_NAME="UISwitchDemo"
# 证书
CODE_SIGN_DISTRIBUTION="iPhone Distribution: Wang Jian (4E2GFJ2AYE) Co., Ltd."
# info.plist路径
project_infoplist_path="./${APP_NAME}/Info.plist"

# archieve路径
archieve_path = "${WORKSPACE}/build}"

#取版本号
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${project_infoplist_path}")

#取build值
bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${project_infoplist_path}")

DATE="$(date +%Y%m%d)"
IPANAME="${APP_NAME}_V${bundleShortVersion}_${DATE}.ipa"

#要上传的ipa文件路径
IPA_PATH="$HOME/${IPANAME}"
echo ${IPA_PATH}
echo "${IPA_PATH}">> text.txt

# //下面2行是没有Cocopods的用法
echo "=================clean================="
xcodebuild -target "${APP_NAME}"  -configuration 'Release' clean

echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild -target "${APP_NAME}" -sdk iphoneos -configuration 'Release' CODE_SIGN_IDENTITY="${CODE_SIGN_DISTRIBUTION}" SYMROOT='$(PWD)'

# //下面2行是集成有Cocopods的用法
# echo "=================clean================="
# xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}"  -configuration 'Release' clean
#
# echo "+++++++++++++++++build+++++++++++++++++"
# xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -sdk iphoneos -configuration 'Release' CODE_SIGN_IDENTITY="${CODE_SIGN_DISTRIBUTION}" SYMROOT='$(PWD)'

# xcrun -sdk iphoneos xcodebuild -exportArchive "./Release-iphoneos/${APP_NAME}.app" -o ~/"${IPANAME}"
xcodebuild -exportArchive "./Release-iphoneos/${APP_NAME}.app" -archivePath ${archieve_path} -exportPath ${IPA_PATH}


#
# 作者：一缕殇流化隐半边冰霜
# 链接：http://www.jianshu.com/p/41ecb06ae95f
# 來源：简书
# 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
