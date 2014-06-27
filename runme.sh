
echo "      _  __ ___  ___   ___ __      __ ___           "
echo "     | |/ /| __|/ __| / _ \\ \    / /|_ _|          "
echo "     | ' < | _| \__ \| (_) |\ \/\/ /  | |           "
echo "     |_|\_\|_|  |___/ \___/  \_/\_/  |___|          "
echo "        _  _         _                              "
echo "  __ _ | || |  ___  (_) _ _    ___   ___  _ _   ___ "
echo " / _  || || | |___| | || ' \  |___| / _ \| ' \ / -_)"
echo " \__,_||_||_|       |_||_||_|       \___/|_||_|\___|"
echo "            _____           _                       "
echo "           |_   _|___  ___ | |                      "
echo "             | | / _ \/ _ \| |                      "
echo "             |_| \___/\___/|_|                      "
echo
echo "------------------------------------------------------------"
echo "Brought to you by the KFSOWI Modding Team"
echo "------------------------------------------------------------"
echo "mint-an"
echo "Gran PC"
echo "KyleBerry.Graphics"
echo "Jonatahn Lyng for unix script"
echo 
echo "------------------------------------------------------------"
echo
echo
sleep 2
echo
echo
clear
echo
echo
echo "WARNING:"
echo "GNU/linux users please verify you have "
echo "core packages: unzip, wget and md5sum"
echo
echo "  1)Restore 11.3.2.3.2       4)Root Kindle"
echo "  2)Install Gapps            5)Enable switching Amazon and Gapps"
echo "  3)Disable OTAs and ads     6)Disable stock SoftKeys"
echo "  7)install another rom"
echo "  9)special root & no OTA's for 11.3.2.3.2 in one"
echo 
echo "             X)Exit Program"
echo
echo "What do you wish to do?"
read index

if [ "$index" = "1" ] ;
then
    clear
    echo "======================================================================"
	echo "This restore tool will download the 11.3.2.3.2 update.bin from amazon"
	echo "using a builtin download manager. When the manager opens simply "
	echo "click OK to begin download. after download has completed, close"
	echo  "download manager and continue."
	echo "***WARNING!!!!***"
	echo "          Failure to follow instructions correctly WILL result in a"
	echo "          soft-bricked device!!! We are not responsible for"
	echo "          what you do!     "
	echo " ***WARNING!!!!***"
	echo "          This option WILL update your device to 11.3.2.3.2"
	echo "          and requires that your kindle still have ADB access"
	echo "          If you are on an older version of software and do not wish"
	echo "          to update, or do not have ADB access on your kindle,"
	echo "          please use GRAN PCs Restore tool available on"
	echo "          https://plus.google.com/communities/115612726860884592519"
	echo "======================================================================"
	echo "Do you wish to continue? (y/n)"
	read restorecont
	if [ "$restorecont" = "y" ] ;
	then
	    if [ ! -f ./kindlesuite/resources/update/update.zip ] ;
	    then
            clear
		    echo "Downloading Bin from Amazon..."
		    wget --no-check-certificate -P ./kindlesuite/resources/update https://gmf.dabbleam.com/KFSOWI/minisystem.img
		    wget --no-check-certificate -P ./kindlesuiteresources/update https://s3.amazonaws.com/kindle-fire-updates/update-kindle-11.3.2.3.2_user_323001620.bin 
		    sleep 2
		    clear
		    mv ./kindlesuite/resources/update/upd* ./kindlesuite/resources/update/update.zip ;
		    echo "power kindle OFF and plug into FASTBOOT cable"
		    echo
		    fastboot -i 0x1949 flash system ./kindlesuite/resources/update/minisystem.img
		    fastboot -i 0x1949 continue
		    echo" if you are stuck at ADB wait for device, plugin your regular cable"
		    echo" plug it also into your computer and manually reboot the device by"
            echo" long pressing power button"
		    echo
		    adb wait-for-device
		    echo
		    echo "Moving update to Kindle (be patient)..."
		    echo
		    adb shell su -c "chmod 777 /cache"
		    adb push ./kindlesuite/resources/update/update.zip /cache/
		    echo
		    echo
		    echo "Setting up restore (be patient)..."
		    echo
		    adb shell su -c "echo --update_package=/cache/update.zip > /cache/recovery/command"
		    echo "unplug Kindle and plug into REGULAR cable if not already done"
		    echo
		    adb wait-for-device
		    adb reboot recovery
		    echo "Device upgrading to 11.3.2.3.2 now."
		    sleep 2
		    clear
		    echo
		    echo
		    echo"-----------------------------------------------------------------------"
		    echo"important notice"
		    echo"----------------"
		    echo
		    echo "turn off wifi and execute 9) as soon as device is upgraded and installed. "
		    echo "failure to do so can cause device to autoinstall an unrootable update"
		    echo "------------------------------------------------------------------------"
		    sleep 20
		    echo "reloading script"
		    sleep 2
		    bash runme.sh
        else
            echo "power kindle OFF and plug into FASTBOOT cable"
		    echo
		    fastboot -i 0x1949 flash system ./kindlesuite/resources/update/minisystem.img
		    fastboot -i 0x1949 continue
		    echo" if you are stuck at ADB wait for device, plugin your regular cable"
		    echo" plug it also into your computer and manually reboot the device by"
                    echo" long pressing power button"
		    echo
		    adb wait-for-device
		    echo
		    echo "Moving update to Kindle (be patient)..."
		    echo
		    adb shell su -c "rm -rf /cache/*"
		    adb shell su -c "chmod 777 /cache"
		    adb push ./kindlesuite/resources/update/update.zip /cache/
		    echo
		    echo
		    echo "Setting up restore (be patient)..."
		    echo
		    adb shell su -c "echo --update_package=/cache/update.zip > /cache/recovery/command"
		    echo "unplug Kindle and plug into REGULAR cable if you haven't allready done so"
		    echo
		    adb wait-for-device
		    adb reboot recovery
		    echo "Device upgrading to 11.3.2.3.2 now."
		    sleep 2
		    clear
		    echo
		    echo
		    echo"-----------------------------------------------------------------------"
		    echo"important notice"
		    echo"----------------"
		    echo
		    echo "turn off wifi and execute 9) as soon as device is upgraded and installed. "
		    echo "failure to do so can cause device to autoinstall an unrootable update"
		    echo "------------------------------------------------------------------------"
		    sleep 20
		    echo "reloading script"
		    sleep 2
		    bash runme.sh

        fi
    
    else
	    bash runme.sh
    fi	

elif [ "$index" = "4" ] ;
then
    clear
	echo " a) 11.3.1.0    b) 11.3.2.1   c) 11.3.2.2  d) 11.3.2.3.2 f) Cancel"
	echo "What software version do you have?"
	read ranswer

	if [ "$ranswer" = "a" ] ;
	then
        clear
		echo "Make sure ADB Debugging is ENABLED!"
		echo
		echo
		echo
		echo
		adb wait-for-device
		echo "Device connected. Pushing files..."
		adb push ./kindlesuite/resources/root/su /data/local/tmp/
		adb push ./kindlesuite/resources/root/exploit /data/local/tmp/
		adb push ./kindlesuite/resources/root/rootme.sh /data/local/tmp/
		echo " Changing permissions..."
		adb shell chmod 755 /data/local/tmp/*
		echo " Executing Exploit (could take some time, be patient!)"
		sleep 2
		adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh"
		echo
		adb reboot
		echo
		echo
		echo "Device should reboot to home screen, and have ROOT!"
		echo "Dont forget to install a superuser app like SuperSU!"
		sleep 10
		echo "reloading script"
		sleep 2
		bash runme.sh

	elif [ "$ranswer" = "b" ] ;
	then
	    clear
		echo "Make sure you power Kindle OFF and plug into FASTBOOT cable"
		sleep 2
		echo
		echo
		echo
		echo "Downgrading Boot Image..."
		echo
		echo
		echo
		echo
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/11310-boot.img
		fastboot -i 0x1949 continue
		echo " if you are stuck at ADB wait for device, plugin your regular cable"
		echo " plug it also into your computer and manually reboot the device by"
                echo " long pressing power button"
		echo
		adb wait-for-device
		echo "Device connected. Pushing files..."
		adb push ./kindlesuite/resources/root/su /data/local/tmp/
		adb push ./kindlesuite/resources/root/exploit /data/local/tmp/
		adb push ./kindlesuite/resources/root/rootme.sh /data/local/tmp/
		echo "Changing permissions..."
		adb shell chmod 755 /data/local/tmp/*
		echo "Executing Exploit (could take some time, be patient!)"
		sleep 2
		adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh";
		echo
		echo
		echo "rebooting fastboot..."
		adb reboot
		echo " if you have a regular cable in, turn off device and plugin your fastboot cable"
		echo
		fastboot -i 0x1949 wait-for-device devices
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/11321-boot.img
		fastboot -i 0x1949 continue
		echo
		echo
		echo "Device should reboot to home screen, and have ROOT!"
		echo "Dont forget to install a superuser app like SuperSU!"
		sleep 10
		echo "reloading script"
		sleep 2
		bash runme.sh

	elif [ "$ranswer" = "c" ] ;
	then
        clear
		echo "Make sure you power Kindle OFF and plug into FASTBOOT cable"
		sleep 2
		echo
		echo
		echo
		echo "Downgrading Boot Image..."
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/11310-boot.img
		fastboot -i 0x1949 continue
		echo" if you are stuck at ADB wait for device, plugin your regular cable"
		echo" plug it also into your computer and manually reboot the device by"
                echo" long pressing power button"
		echo
		adb wait-for-device
		echo "Device connected. Pushing files..."
		adb push ./kindlesuite/resources/root/su /data/local/tmp/
		adb push ./kindlesuite/resources/root/exploit /data/local/tmp/
		adb push ./kindlesuite/resources/root/rootme.sh /data/local/tmp/
		echo "Changing permissions..."
		adb shell chmod 755 /data/local/tmp/*
		echo "Executing Exploit (could take some time, be patient!)"
		sleep 2
		adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh";
		echo
		echo
		echo "rebooting fastboot..."
		echo" if you have a regular cable, turn off device and plugin your fastboot cable"
		echo
		adb reboot
		fastboot -i 0x1949 wait-for-device devices
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/11322-boot.img
		fastboot -i 0x1949 continue
		echo
		echo
		echo "Device should reboot to home screen, and have ROOT!"
		echo "Dont forget to install a superuser app like SuperSU!"
		sleep 10
		echo "reloading script"
		sleep 2
		bash runme.sh
		
	elif [ "$ranswer" = "d" ] ;
	then
        clear
		echo "Make sure you power Kindle OFF and plug into FASTBOOT cable"
		sleep 2
		echo
		echo
		echo
		echo "Downgrading Boot Image..."
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/11322-boot.img
		fastboot -i 0x1949 continue
		echo" if you are stuck at ADB wait for device, plugin your regular cable"
		echo" plug it also into your computer and manually reboot the device by"
                echo" long pressing power button"
		echo
		adb wait-for-device
		echo "Device connected. Pushing files..."
		adb push ./kindlesuite/resources/root/su /data/local/tmp/
		adb push ./kindlesuite/resources/root/exploit /data/local/tmp/
		adb push ./kindlesuite/resources/root/rootme.sh /data/local/tmp/
		echo "Changing permissions..."
		adb shell chmod 755 /data/local/tmp/*
		echo "Executing Exploit (could take some time, be patient!)"
		sleep 2
		adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh";
		echo
		echo
		echo "rebooting fastboot..."
		echo" if you have a regular cable, turn off device and plugin your fastboot cable"
		echo
		adb reboot
		fastboot -i 0x1949 wait-for-device devices
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/113232-boot.img
		fastboot -i 0x1949 continue
		echo
		echo
		echo "Device should reboot to home screen, and have ROOT!"
		echo "Dont forget to install a superuser app like SuperSU!"
		sleep 10
		echo "reloading script"
		sleep 2
		bash runme.sh

	else
	    bash runme.sh
	fi

elif [ "$index" = "9" ] ;
	then
        clear
		echo "Make sure you power Kindle OFF and plug into FASTBOOT cable"
		sleep 2
		echo
		echo
		echo
		echo "Downgrading Boot Image..."
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/11310-boot.img
		fastboot -i 0x1949 continue
		echo "you might want to unplug fastboot cable, long press power button"
		echo ", plug regular cable and restart the device by pressing power"
		echo " button now if device is still in fastboot mode."
		adb wait-for-device
		echo "Device connected. Pushing files..."
		adb push ./kindlesuite/resources/root/su /data/local/tmp/
		adb push ./kindlesuite/resources/root/exploit /data/local/tmp/
		adb push ./kindlesuite/resources/root/rootme.sh /data/local/tmp/
		echo "Changing permissions..."
		adb shell chmod 755 /data/local/tmp/*
		echo "Executing Exploit (could take some time, be patient!)"
		sleep 2
		adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh";
		echo
		echo
		echo "rebooting fastboot..."
		adb reboot
		echo "if you changed cables,turn off the device and"
		echo " plug back in fastboot cable"
		fastboot -i 0x1949 wait-for-device devices
		fastboot -i 0x1949 flash boot ./kindlesuite/resources/boot/113232-boot.img
		fastboot -i 0x1949 continue
		echo
		echo
		echo "Device should reboot to home screen"
		echo "you might want to unplug fastboot cable, long press power button"
		echo ", plug regular cable and restart the device by pressing power"
		echo " button now if device is still in fastboot mode."
		echo "now, removing OTA software"
		adb wait-for device
		adb shell
		su
		mount -o remount rw, /system
		cd/system/app/
		rm com.amazon.dcp.apk
		rm com.amazon.dcp.odex
		rm *dtcp*
		echo "all is done, no further OTA's for you!In order to do this"
		echo "your device was also rooted, install a superuser.apk"
        sleep 10
        echo "reloading script"
        sleep 2
        bash runme.sh

elif [ "$index" = "2" ] ;
then
    clear
	echo 
	echo " ========================================================"
	echo " ***WARNING***                                          "
	echo "             This option will install Gapps and cause   "
	echo "             Amazon Apps to stop functioning            "
	echo "    (the aaps malfunction can be undone using option 6) "
	echo " ========================================================"
	echo
	echo "Do you wish to continue? (y/n)"
	read gappscont

	if [ "$gappscont" = "y" ] ;
	then
	    if [ ! -f ./kindlesuite/resources/gaaps/Lu*]
	    then
             echo "downloading Gapps"
	        wget -P ./kindlesuite/resources http://dl.kfsowi.com/tools/kindlesuite/gapps.zip
	        echo "decompacting Gapps"
	        unzip ./kindlesuite/resources/gapps.zip
	        rm ./kindlesuite/resources/gapps.zip
	    fi
	        clear
		    echo "Plug kindle into regular cable with ADB Debugging enabled..."
		    adb wait-for-device
		    echo
		    echo "Installing Lucky Patcher..."
		    adb install ./kindlesuite/resources/gapps/Lucky-Patcher-v4.1.9.apk
		    echo
		    echo " Making temporary directories..."
		    adb shell mkdir /sdcard/gapps
		    adb shell mkdir /sdcard/lib
		    adb shell mkdir /sdcard/framework
		    adb shell mkdir /sdcard/etc
		    adb shell mkdir /sdcard/etc/permissions 
		    echo
		    echo "Pushing files to SD..."
		    adb push ./kindlesuite/resources/gapps/gapps/LatinImeDictionaryPack.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/MediaUploader.apk sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/NetworkLocation.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/QuickSearchBox.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GmsCore.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GooglePlus.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/Gmail.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GoogleBackupTransport.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GoogleCalendarSyncAdapter.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GoogleContactsSyncAdapter.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GoogleFeedback.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GoogleLoginService.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GooglePartnerSetup.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/GoogleServicesFramework.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/Phonesky.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/DownloadProvider.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/DownloadProviderUi.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/AppWidgetPicker.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/gapps/Maps.apk /sdcard/gapps
		    adb push ./kindlesuite/resources/gapps/lib/libpatts_engine_jni_api.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/lib/libspeexwrapper.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/lib/libAppDataSearch.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/lib/libgames_rtmp_jni.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/lib/libgcastv2_base.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/lib/libgcastv2_support.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/lib/libjgcastservice.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/lib/libjni_latinime.so /sdcard/lib
		    adb push ./kindlesuite/resources/gapps/framework/com.google.android.maps.jar /sdcard/framework
		    adb push ./kindlesuite/resources/gapps/framework/com.google.android.media.effects.jar /sdcard/framework
		    adb push ./kindlesuite/resources/gapps/framework/com.google.widevine.software.drm.jar /sdcard/framework
		    adb push ./kindlesuite/resources/gapps/etc/permissions/com.google.android.maps.xml /sdcard/etc/permissions
		    adb push ./kindlesuite/resources/gapps/etc/permissions/com.google.android.media.effects.xml /sdcard/etc/permissions
		    adb push ./kindlesuite/resources/gapps/etc/permissions/com.google.widevine.software.drm.xml /sdcard/etc/permissions
		    echo
		    echo
	    	echo "Copying files to System..."
	    	adb shell su -c "mount -o remount rw, /system"
	    	adb shell su -c "rm /system/app/DownloadProvider*.*"
		    adb shell su -c "cp /sdcard/gapps/* /system/app/"
		    adb shell su -c "cp /sdcard/lib/* /system/lib/"
		    adb shell su -c "cp /sdcard/framework/* /system/framework/"
		    adb shell su -c "cp /sdcard/etc/permissions/* /system/etc/permissions/"
		    echo
	    	echo
		    echo "removing temp files..."
		    adb shell rm -rf /sdcard/gapps
		    adb shell rm -rf /sdcard/lib
		    adb shell rm -rf /sdcard/framework
		    adb shell rm -rf /sdcard/etc
		    adb shell rm -rf /sdcard/etc/permissions
		    echo
		    echo
		    echo "File copy complete, open Lucky Patcher on kindle and select toolbox at bottom."
		    echo "Select patch to android. "
		    echo "Select disable signature verification in pkg manager."
	    	echo "Congratulations, You now have Google Play Store!"
	    	sleep 10
	    	echo "reloading script"
	    	sleep 2
	    	bash runme.sh
	else 
	     bash runme.sh
	fi

elif [ "$index" = "5" ] ;
then
    clear
	echo "==============================================================="
	echo "This option will change the the Download Provider "
	echo "It is ONLY for rooted STOCK Fireos"
	echo "Emphasis on ONLY FOR STOCK rom"
	echo "==============================================================="
	echo "Do you wish to continue? (y/n)"
	read aappscont
	clear

	if [ "$aappscont" = "y" ] ;
	then
	    if [ ! -f ./kindlesuite/resources/tools/dlps/dlpc];
	    then
	    echo "Downloading DLPC..."
	    wget -P ./kindlesuite/resources/tools http://dl.kfsowi.com/tools/legacy/appstore_switcher.zip
	    echo "unzipping tools..."
	    unzip ./kindlesuite/resources/tools/appstore_switcher.zip
	    mv ./kindlesuite/resource/tools/appstore_switcher ./resources/tools/dlpc
	    rm ./kindlesuite/resources/tools/apstore_switcher.zip
	    
	    fi
	    
	    clear
	    echo "Installing dlpc..."
		echo "Plug kindle into regular cable with ADB Debugging enabled..."
		adb wait-for-device
		echo
		adb shell mkdir /sdcard/dlpc 
		echo
		adb push ./kindlesuite/resources/tools/dlpc/DownloadProvider.apk /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/DownloadProvider.odex /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/DownloadProviderUi.apk /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/DownloadProviderUi.odex /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/DownloadProvider.apkgg /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/DownloadProviderUi.apkgg /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/dlpc.x /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/dlp.x /sdcard/dlpc
		adb push ./kindlesuite/resources/tools/dlpc/hotreboot.x /sdcard/dlpc
		echo
		echo
		adb shell su -c "mount -o remount rw, /cache"
		adb shell su -c "chmod 777 /cache"
		adb shell su -c "rm -rf /cache/dlpc"
		adb shell su -c "mkdir /cache/dlpc"
		adb shell su -c "cp /sdcard/dlpc/* /cache/dlpc"
		adb shell su -c "rm -rf /sdcard/dlpc"
		adb shell su -c "mv /cache/dlpc/dlpc.x /cache dlpc/dlpc"
		adb shell su -c "mv /cache/dlpc/dlp.x /cache/dlpc/dlp"
		adb shell su -c "mv /cache/dlpc/hotrebot.x /cache/dlpc/hotreboot"
		adb shell su -c "chown 0.2000 /cache/dlpc/dlpc"
		adb shell su -c "chown 0.2000 /cache/dlpc/dlp"
		adb shell su -c "chown 0.2000 /cache/dlpc/hotreboot"
		adb shell su -c "chown 0,0 /cache/dlpc/*.apk"
		adb shell su -c "chown 0.0 /cache/dlpc/*.odex"
		adb shell su -c "chmod 644 /cache/dlpc/*.apk"
		adb shell su -c "chmod 644 /cache/dlpc/*.odex"
		adb shell su -c "chmod 755 /cache/dlpc/dlpc"
		adb shell su -c "chmod 755 /cache/dlpc/dlp"
		adb shell su -c "chmod 755 /cache/dlpc/hotreboot"
		adb shell su -c "mount -o remount rw, /system"
		adb shell su -c "rm /system/bin/dlpc"
		adb shell su -c "rm /system/bin/dlp"
		adb shell su -c "rm /system/bin/hotreboot"
		adb shell su -c "rm /sysytem/bin/DownloadProvider*"
		adb shell su -c "cp /cache/dlpc/dlpc /system/bin"
		adb shell su -c "cp /cache/dlpc/dlp /system/bin"
		adb shell su -c "cp /cache/dlcp/hotreboot /system/bin"
		adb shell su -c "chmod 770 /cache"
		adb shell su -c "mount -o remount rw, /cache"
		adb shell su -c "mount -o remount rw, /system"
		clear
		echo "dlpc installed"
		echo
		echo"To check current run: dlp"
		echo"To change        run: dlpc"
		echo
		echo" via terminal emulator on Android itself"
		sleep 10
		echo "reloading script"
		sleep 2
		bash runme.sh

	else
	    bash runme.sh
    fi
    
elif [ "$index" = "3" ] ;
then
    echo "Plug kindle into regular cable with ADB Debugging enabled..."
	adb wait-for-device 
	adb shell su -c "mount -o remount rw, /system"
	adb shell su -c "rm /system/app/*dcp.apk"
	adb shell su -c "rm /system/app/*dcp.odex"
	adb shell su -c "rm /system/app/*dtcp*"
	echo "OTAs and Lockscreen Ads Disabled!"
	sleep 10
	echo "reloading script"
	sleep 2
	bash runme.sh

elif ["$index" = "7" ] ;
then
    clear
    echo "----------------------------------------------------"
    echo "----------------WARNING!----------------------------"  
    echo "Before proceeding, check your kindle HD is KFSOWI:"
    echo "if KFTT, those roms will brick your device!"
    echo "----------------------------------------------------"
    echo "chose a rom for instalation:"
    echo " a)Ice"
    echo " b) Hellfire"
    echo " c)Plasma   "
    echo 
    echo 
    echo 
    echo 
	read rom

	if [ "$rom" = "a" ] ;
	then
	    clear
		SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
		mkdir -p $SCRIPTPATH/kindlesuite/resources/rom/ice
		if [ -f ./kindlesuite/resources/rom/ice/MD5];
		then
			mkdir ./kindlesuite/resources/rom/ice
			echo Downloading ice...
		fi
		if [ -f ./kindlesuite/resources/rom/ice/ice.zip ] ;
		then
			wget -P ./kindlesuite/resources/rom/ice http://dl.kfsowi.com/roms/ice/latest/ice.zip
			rm -p ./kindlesuite/resources/rom/ice/MD5
			wget -P ./kindlesuite/resources/rom/ice http://dl.kfsowi.com/roms/ice/latest/MD5
		fi
		if [ -f resources/rom/ice/MD5local ] ;
		then
			md5sum -u ./kindlsuite/resources/rom/ice/ice.zip > ./kindlesuite/resources/rom/ice/MD5local
			set /p md5=<./kindlesuite/resources/rom/ice/MD5
			set /p md5local=<./kindlesuite/resources/rom/ice/MD5local
		fi
		if [ -f"%md5%" == "%md5local%" ] ;
		then
		echo " There was a problem with the download. Please close program and try again."
		rmdir -p $pwd/kindlesuite/resources/rom/ice
		sleep 2
		bash runme.sh
		fi
		echo
		echo
		echo Unzipping ice...
		echo
		echo
		echo "Moving ice to Kindle (Be patient, takes ~5 mins)"
		echo "Make sure kindle is plugged into" 
		echo "regular cable with ADB enabled!"
		adb wait-for-device 
		echo "moving..."
		adb wait-for-device
		adb push ./kindlesuite/resources/rom/ice/ice.img /sdcard/
		echo
		echo
		echo "Installing ice (takes ~5 mins)..."
		adb shell su -c "dd if=/sdcard/ice.img of=/dev/block/mmcblk0p9"
		echo
		echo
		echo "Ice Installed, Rebooting Now!"
		adb reboot recovery
		echo "select wipe and reboot"
		sleep 10
		bash runme.sh
		echo
		echo
		echo Unzipping ice...
		if [ ! -f ./kindlesuite/resources/rom/ice/*.img] ;
		then
			unzip  ./kindlesuite/resources/rom/ice/ice.zip ./kindlesuite/resources/rom/ice/
			mv ./kindlesuite/resources/rom/ice/ice*.img ./kindlesuite/resources/rom/ice/ice.img
		fi
		echo
		echo
		echo "Moving ice to Kindle (Be patient, takes ~5 mins)"
		echo "Make sure kindle is plugged into" 
		echo "regular cable with ADB enabled!"
		adb wait-for-device 
		echo "moving..."
		adb wait-for-device push ./kindlesuite/resources/rom/ice/ice.img /sdcard/
		echo
		echo
		echo "Installing ice (takes ~5 mins)..."
		adb shell su -c "dd if=/sdcard/ice.img of=/dev/block/mmcblk0p9"
		echo
		echo
		echo "Ice Installed, Rebooting Now!"
		adb reboot recovery
		echo "select wipe and reboot"
		sleep 10
		bash runme.sh

	elif [ "$rom" = "b" ] ;
	then
	    clear

		SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
		mkdir -p $SCRIPTPATH/kindlesuiteresources/rom/hellfire
		if [ ! -f ./kindlesuite/resources/rom/hellfire/hellfire.zip ] ;
		then
			echo "downloading hellfire..."
			wget -P ./kindlesuite/resources/rom/hellfire http://dl.kfsowi.com/roms/hellfire/latest/hellfire.zip ;
			rm  ./kindlesuite/resources/rom/hellfire/MD5
			wget -P ./kindlesuite/resources/rom/hellfire http://dl.kfsowi.com/roms/hellfire/latest/MD5 ;
		fi
		if [ ! -f ./kindlesuite/resources/rom/hellfire/MD5local ] ;
		then
			md5sum -u $./kindlesuite/resources/rom/hellfire/hellfire.zip > ./kindlesuite/resources/rom/hellfire/MD5local
			set /p md5=< ./kindlesuite/resources/rom/hellfire/MD5
			set /p md5local=< ./kindlesuite/resources/rom/hellfire/MD5local
		fi
		if [ "$md5" != "$md5local" ] ;
		then
			echo " There was a problem with the download. Please close program and try again."
			rmdir -p $pwd/kindlesuite/resources/rom/hellfire
			sleep 2
			bash runme.sh
		fi
		echo
		echo
		echo Unzipping hellfire...
		if [ ! -f ./kindlesuite/resources/rom/hellfire/hellfire.img ] ;
		then
			unzip  ./kindlesuite/resources/rom/hellfire/hellfire.zip ./kindlesuite/resources/rom/hellfire/
			mv ./kindlesuite/resources/rom/hellfire/hellfire* ./kindlesuite/resources/rom/hellfire/hellfire.img
		fi
			echo
			echo
			echo "Moving hellfire to Kindle (Be patient, takes ~5 mins)"
			echo "Make sure kindle is plugged into" 
			echo "regular cable with ADB enabled!"
			adb wait-for-device 
			echo "moving..."
			adb wait-for-device
			adb push ./kindlesuite/resources/rom/hellfire/hellfire.img /sdcard/
			echo
			echo
			echo "Installing hellfire (takes ~5 mins)..."
			adb shell su -c "dd if=/sdcard/hellfire.img of=/dev/block/mmcblk0p9"
			echo
			echo
			echo "hellfire Installed, Rebooting Now!"
			adb reboot recovery
			echo "select wipe and reboot"
			sleep 10
			bash runme.sh
			
	elif [ "$rom" = "c" ] ;
	then
	    clear
	    	SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
		mkdir -p $SCRIPTPATH/kindlesuiteresources/rom/plasma
		if [ ! -f ./kindlesuite/resources/rom/plasma/plasma.zip ] ;
		then
			echo "downloading plasma..."
			wget -P ./kindlesuite/resources/rom/plasma http://dl.kfsowi.com/roms/plasma/latest/plasma.zip ;
			rm  ./kindlesuite/resources/rom/plasma/MD5
			wget -P ./kindlesuite/resources/rom/plasma http://dl.kfsowi.com/roms/plasma/latest/MD5 ;
		fi
		if [ ! -f ./kindlesuite/resources/rom/plasma/MD5local ] ;
		then
			md5sum -u $./kindlesuite/resources/rom/plasma/plasma.zip > ./kindlesuite/resources/rom/plasma/MD5local
			set /p md5=< ./kindlesuite/resources/rom/plasma/MD5
			set /p md5local=< ./kindlesuite/resources/rom/plasma/MD5local
		fi
		if [ "$md5" != "$md5local" ] ;
		then
			echo " There was a problem with the download. Please close program and try again."
			rmdir -p $pwd/kindlesuite/resources/rom/plasma
			sleep 2
			bash runme.sh
		fi
		echo
		echo
		echo Unzipping plasma...
		if [ ! -f ./kindlesuite/resources/rom/plasma/plasma.img ] ;
		then
			unzip  ./kindlesuite/resources/rom/plasma/plasma.zip ./kindlesuite/resources/rom/plasma/
			mv ./kindlesuite/resources/rom/plasma/plasma* ./kindlesuite/resources/rom/plasma/plasma.img
		fi
			echo
			echo
			echo "Moving plasma to Kindle (Be patient, takes ~5 mins)"
			echo "Make sure kindle is plugged into" 
			echo "regular cable with ADB enabled!"
			adb wait-for-device 
			echo "moving..."
			adb wait-for-device
			adb push ./kindlesuite/resources/rom/plasma/plasma.img /sdcard/
			echo
			echo
			echo "Installing plasma (takes ~5 mins)..."
			adb shell su -c "dd if=/sdcard/plasma.img of=/dev/block/mmcblk0p9"
			echo
			echo
			echo "plasma Installed, Rebooting Now!"
			adb reboot recovery
			echo "select wipe and reboot"
			sleep 10
			bash runme.sh
			
	    
	else
	    bash runme.sh
	fi

elif [ "$index" = "6" ] ;
then
    clear
	echo 
	echo " ============================================= "
	echo " PREREQUISITES*** "
	echo "   This feature requires BUSYBOX and XPOSED  "
	echo "   FRAMEWORK with the GRAVITYBOX module. "
	echo "   You will either need to enable GRAVITYBOX "
	echo "   pie controls, or install and setup  "
	echo "   a secondary Navigation app prior to "
	echo "   installing this feature to be able to nav- "
	echo "   igate your KINDLE. Failure to do so will"
	echo "   result in loss of navigation control "
	echo "   on your device!                            "                                   
	echo " ============================================="
	echo
	echo " Do you wish to continue? (y/n)"
	read skcont

	if [ "$skcont" = "y" ] ;
    then
        clear
		echo "Plug kindle into regular cable with ADB Debugging enabled..."
		adb wait-for-device
		echo
		echo "Editing build.prop..."
		adb shell su -c "mount -o remount,rw /system && echo qemu.hw.mainkeys=1>>/system/build.prop && mount -o remount,ro /system"
		adb shell su -c "mount -o remount rw, system"
		echo
		echo "Activate GravityBox and in the Misc. Tweaks menu set overflow menu to ALWAYS."
		echo
		echo "Once done your NavBar will function with the overflow menu enabled!"
		echo " *requires reboot*"
		sleep 10
		echo "reloading script"
		sleep 2
		bash runme.sh

	else
	    bash runme.sh
	fi

elif [ "$index" = "x" ] ;
then
    exit

else
    bash runme.sh
    
fi

