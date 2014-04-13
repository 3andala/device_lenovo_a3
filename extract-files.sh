#!/bin/sh

VENDOR=lenovo
DEVICE=a3

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi

cp ~/a3-blobs/$FILE $BASE/$FILE

#adb pull /system/$FILE $BASE/$FILE
done

# some extra stuff
cp ~/a3-blobs/system/lib/hw/audio_policy.default.so $BASE/lib/hw/audio_policy.mt6589.so
cp ~/a3-blobs/system/lib/libaudio.primary.default.so $BASE/lib/hw/audio.primary.mt6589.so

#adb pull /system/lib/hw/audio_policy.default.so $BASE/lib/hw/audio_policy.mt6589.so
#adb pull /system/lib/libaudio.primary.default.so $BASE/lib/hw/audio.primary.mt6589.so

./setup-makefiles.sh
