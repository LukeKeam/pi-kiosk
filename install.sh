# easy install options curl -LJO https://raw.githubusercontent.com/LukeKeam/pi-kiosk/master/install.sh && sudo sh ./install.sh
# creat dir /pi-enviro
echo "make directory /pi-kiosk "
mkdir ~/pi-kiosk
cd ~/pi-kiosk
sudo chown -R "$USER":"$USER" /pi-kiosk
# install git
sudo apt-get update
sudo apt-get install git sed xdotool -y
# clone repository
echo "downloading update"
git clone https://github.com/LukeKeam/pi-kiosk
# make service so it starts automatically
echo "making service"
append_line='[Unit]
Description=Chromium Kiosk
Wants=graphical.target
After=graphical.target

[Service]
Environment=DISPLAY=:0.0
Environment=XAUTHORITY=/home/pi/.Xauthority
Type=simple
ExecStart=/bin/bash ~/pi-kiosk/pi-kiosk.sh
Restart=on-abort

[Install]
WantedBy=graphical.target'
echo "$append_line" | sudo tee /lib/systemd/system/pi-kiosk.service
sudo systemctl enable pi-kiosk.service
sudo systemct start pi-kiosk.service
# done
echo "all done!"

