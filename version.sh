#!/bin/sh
#
ARCH=$(uname -m)

if [ $(which nproc) ] ; then
	CORES=$(nproc)
else
	CORES=1
fi

#Debian 7 (Wheezy): git version 1.7.10.4 and later needs "--no-edit"
unset GIT_OPTS
unset GIT_NOEDIT
LC_ALL=C git help pull | grep -m 1 -e "--no-edit" >/dev/null 2>&1 && GIT_NOEDIT=1

if [ "${GIT_NOEDIT}" ] ; then
	GIT_OPTS="${GIT_OPTS} --no-edit"
fi

config="multi_v7_defconfig"

#toolchain="arm9_gcc_4_7"
#toolchain="gcc_arm_embedded_4_8"
#toolchain="cortex_gcc_4_6"
#toolchain="cortex_gcc_4_7"
#toolchain="cortex_gcc_4_8"
toolchain="gcc_linaro_gnueabihf_4_8"

#Kernel/Build
KERNEL_REL=3.14
KERNEL_TAG=${KERNEL_REL}-rc5
BUILD=armv7-devel-r74

#v3.X-rcX + upto SHA
KERNEL_SHA="c3bebc71c4bcdafa24b506adf0c1de3c1f77e2e0"

#git branch
#BRANCH="v3.14.x"

BUILDREV=1.0
DISTRO=cross
DEBARCH=armhf
