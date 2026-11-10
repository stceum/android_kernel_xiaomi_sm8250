#!/bin/bash

set -ex

# mkdir toolchain && cd toolchain
# git clone -b lineage-19.1 https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9
# git clone -b android11-release https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86
export PATH=${PWD}/toolchain/linux-x86/clang-r370808/bin:$PATH
export ARCH=arm64
export SUBARCH=arm64
# export DTC_EXT=dtc

CROSS_COMPILE=${PWD}/toolchain/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9/bin/aarch64-linux-android-

make -j$(nproc) -C $(pwd) O=$(pwd)/out CLANG_TRIPLE=aarch64-linux-gnu- thyme_defconfig

make -j$(nproc) -C $(pwd) O=$(pwd)/out CROSS_COMPILE=$CROSS_COMPILE CLANG_TRIPLE=aarch64-linux-gnu- ARCH=arm64 SUBARCH=arm64 CC=clang LLVM=1
