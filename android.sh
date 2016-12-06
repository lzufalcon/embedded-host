#!/bin/bash
#
## Android Studio/SDK/NDK from https://developer.android.com/develop/index.html
#

TOP_DIR=$(dirname `readlink -f $0`)

studio_major_version=2.2.2.0
studio_minor_version=145.3360264
studio_file=android-studio-ide-${studio_minor_version}-linux.zip
studio_url=https://dl.google.com/dl/android/studio/ide-zips/${studio_major_version}/$studio_file
if [ ! -f $studio_file ]; then
    wget -c $studio_url
    unzip -n -q $studio_file
fi

sdk_version=r24.4.1
sdk_file=android-sdk_${sdk_version}-linux.tgz
sdk_url=https://dl.google.com/android/$sdk_file
if [ ! -f $sdk_file ]; then
    wget -c $sdk_url
    tar --skip-old-files -zxf $sdk_file
fi

# https://github.com/android-ndk/ndk/wiki
ndk_version=r13b
ndk_file=android-ndk-${ndk_version}-linux-x86_64.zip
ndk_url=https://dl.google.com/android/repository/$ndk_file
if [ ! -f $ndk_file ]; then
    wget -c $ndk_url
    rm -rf android-ndk-linux
    unzip -n -q $ndk_file
    mv android-ndk-${ndk_version} android-ndk-linux
fi

sed -i -e "/ANDROID SDK START 842834892/,/ANDROID SDK END 764237492/d" ~/.bashrc
cat <<EOF >> ~/.bashrc
# ANDROID SDK START 842834892
export PATH=\$PATH:${TOP_DIR}/android-studio/bin:${TOP_DIR}/android-studio/bin64
export PATH=\$PATH:${TOP_DIR}/android-sdk-linux/tools/
export PATH=\$PATH:${TOP_DIR}/android-ndk-linux/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/
export PATH=\$PATH:${TOP_DIR}/android-ndk-linux/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/

export CLASSPATH=\$CLASSPATH:${TOP_DIR}/android-studio/lib/:${TOP_DIR}/android-sdk-linux/android-sdk-linux/tools/lib/
# ANDROID SDK END 764237492
EOF
