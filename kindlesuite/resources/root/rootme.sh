#!/system/bin/sh
/system/bin/mount -o remount,rw /system
/system/bin/cat /data/local/tmp/su > /system/xbin/su
/system/bin/chown 0.0 /system/xbin/su
/system/bin/chmod 06755 /system/xbin/su
