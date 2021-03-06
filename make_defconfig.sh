#!/bin/bash

for device in d850; do

DEFCONFIG_FILE=${device}_defconfig

if [ ! -e arch/arm/configs/$DEFCONFIG_FILE ]; then
	echo "No such file: arch/arm/configs/$DEFCONFIG_FILE"
	exit -1
fi

# make .config
make ARCH=arm CROSS_COMPILE=arm-linux-androideabi- ${DEFCONFIG_FILE} -j18

mv .config arch/arm/configs/${DEFCONFIG_FILE}
done
make mrproper -j8