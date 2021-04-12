#!/bin/sh

#copia archivo shared memory

echo "Installing config file idac_xbee ..."
sudo cp ./idac_xbee_iokeyfile /home/pi/
sudo cp ./idac_xbee_client.service /etc/systemd/system/
sudo cp ./idac_xbee_monitor_reset.service /etc/systemd/system/
sudo cp ./idac_xbee_serial.service /etc/systemd/system/

#if  directory already exist 
#if [ -d "/home/pi/idac_xbee_bin/" ]; then
#	echo "Directory /home/pi/idac_adr_bin/ already exist"
	#echo "Removing directory /home/pi/idac_bin/ ..."
	#rm -rf /home/pi/idac_bin/
	#echo "Make directory again..."
        #mkdir /home/pi/idac_bin/
#else
#	echo "Make directory.."
#	mkdir /home/pi/idac_xbee_bin/
#fi


sudo systemctl stop idac_xbee_serial.service
sudo systemctl stop idac_xbee_client.service
sudo systemctl stop idac_xbee_monitor_reset.service
#sudo systemctl daemon-reload

# copy exec and ask overwrite
cp xbee_serial /home/pi/idac_xbee_bin/
cp xbee_client /home/pi/idac_xbee_bin/
cp xbee_monitor_reset /home/pi/idac_xbee_bin/

#add permission exec - by default 644 -rw-r--r--
chmod +x /home/pi/idac_xbee_bin/xbee_serial /home/pi/idac_xbee_bin/xbee_client /home/pi/idac_xbee_bin/xbee_monitor_reset

sudo systemctl stop idac_xbee_serial.service
sudo systemctl daemon-reload
sudo systemctl enable idac_xbee_serial.service
sudo systemctl start idac_xbee_serial.service

sudo systemctl stop idac_xbee_client.service
sudo systemctl daemon-reload
sudo systemctl enable idac_xbee_client.service
sudo systemctl start idac_xbee_client.service

sudo systemctl stop idac_xbee_monitor_reset.service
sudo systemctl daemon-reload
sudo systemctl enable idac_xbee_monitor_reset.service
sudo systemctl start idac_xbee_monitor_reset.service

sudo systemctl status idac_xbee_serial.service
sudo systemctl status idac_xbee_client.service
sudo systemctl status idac_xbee_monitor_reset.service
#sudo pstree $(pidof monitor_process)