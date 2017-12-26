#!/bin/sh

#  build.sh
#  CApplication
#
#  Created by 张九州 on 2017/12/22.
#  Copyright © 2017年 张九州. All rights reserved.

FMK_NAME=CApplication
INSTALL_DIR=./Products/${FMK_NAME}.framework
WRK_DIR=build
DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework

xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build
xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build

if [ -d "${INSTALL_DIR}" ]
then
    rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
cp -R "${SIMULATOR_DIR}/" "${INSTALL_DIR}/"

lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"
#rm -r "${WRK_DIR}"
open "${INSTALL_DIR}"
