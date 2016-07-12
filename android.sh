#!/bin/bash
#
## Android Studio/SDK/NDK from https://developer.android.com/develop/index.html
#

TOP_DIR=$(dirname `readlink -f $0`)

studio_major_version=2.1.2.0
studio_minor_version=143.2915827
wget -c https://dl.google.com/dl/android/studio/ide-zips/${studio_major_version}/android-studio-ide-${studio_minor_version}-linux.zip
unzip android-studio-ide-${studio_minor_version}-linux.zip

sdk_version=r24.4.1
wget -c https://dl.google.com/android/android-sdk_${sdk_version}-linux.tgz
tar zxf android-sdk_${sdk_version}-linux.tgz

ndk_version=r12b
wget -c http://dl.google.com/android/repository/android-ndk-${ndk_version}-linux-x86_64.zip
unzip android-ndk-${ndk_version}-linux-x86_64.zip
mv android-ndk-${ndk_version} android-ndk-linux

sed -i -e "/ANDROID SDK START 842834892/,/ANDROID SDK END 764237492/d" ~/.bashrc
cat <<EOF >> ~/.bashrc
# ANDROID SDK START 842834892
export PATH=$PATH:${TOP_DIR}/android-studio/bin:${TOP_DIR}/android-studio/bin64
export PATH=$PATH:${TOP_DIR}/android-sdk-linux/tools/
export PATH=$PATH:${TOP_DIR}/android-ndk-linux/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/
export PATH=$PATH:${TOP_DIR}/android-ndk-linux/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/

export CLASSPATH=$CLASSPATH:${TOP_DIR}/android-studio/lib/:${TOP_DIR}/android-sdk-linux/android-sdk-linux/tools/lib/
# ANDROID SDK END 764237492
EOF
