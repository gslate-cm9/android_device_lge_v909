#!/bin/sh

CMD=${LGE_HC_CP_CMD:-adb pull}
SOURCE=${LGE_HC_SOURCE:-/system}

BASE=../../../vendor/lge/v909/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    ${CMD} "${SOURCE}/$FILE" $BASE/$FILE
done

./setup-makefiles.sh
