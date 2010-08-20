#!/system/bin/bash
# Startup script launched at recovery startup

NANDROID_PATH="/sdcard/nandroid"
DEVICE_ID="mem=109M"
# Migrate nandroid backup tree to new layout
if [ -e "${NANDROID_PATH}/${DEVICE_ID}" ];
then
  echo "Old nandroid directory layout detected, migrating"
  cd ${NANDROID_PATH};
  find "${DEVICE_ID}" -mindepth 1 -maxdepth 1 | while read dir;
  do
    BKP=`basename $dir`;
    SLOT="${BKP:0:5}";
    mkdir -p $SLOT;
    mv "$dir" "$SLOT/${BKP:6}";
  done
  rmdir "mem=109M"
fi

exit 0
