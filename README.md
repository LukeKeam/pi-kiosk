# easy install
curl -LJO https://raw.githubusercontent.com/LukeKeam/pi-kiosk/master/install.sh && sudo sh ./install.sh

# stop pi-kiosk
sudo systemctl stop pi-kiosk.service

# restart pi-kiosk
sudo systemctl start pi-kiosk.service