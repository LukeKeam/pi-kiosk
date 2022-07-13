# easy install options curl -LJO https://raw.githubusercontent.com/LukeKeam/pi-kiosk/master/install.sh && sudo bash ./install.sh
# install git sed xdotool
sudo apt-get update
sudo apt-get install git sed xdotool chromium -y
# make dir
sudo mkdir /pi-kiosk
cd /pi-kiosk
# clone repository
echo "downloading pi-kiosk"
git clone https://github.com/LukeKeam/pi-kiosk .
# change ownership
sudo chown -R "$USER":"$USER" /pi-kiosk
# make service so it starts automatically
echo "making service"
append_line='[Unit]
Description=pi-kiosk
Wants=graphical.target
After=graphical.target

[Service]
Environment=DISPLAY=:0.0
Environment=XAUTHORITY=/home/pi/.Xauthority
Type=simple
ExecStart=/bin/bash /pi-kiosk/pi-kiosk.sh
Restart=on-abort

[Install]
WantedBy=graphical.target'
echo "$append_line" | sudo tee /lib/systemd/system/pi-kiosk.service
sudo systemctl enable pi-kiosk.service
sudo systemctl start pi-kiosk.service
# done
echo "all done!"

