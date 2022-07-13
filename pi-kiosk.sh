# Disable screen saver and power management
xset s noblank
xset s off
xset -dpms


# Remove mouse, needed?
# unclutter -idle 0.5 -root &


# Remove Chromium errors "Chromium didnt shutdown error"
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences


# Launch Chromium
# added some of my sites as an example
/usr/bin/chromium --start-fullscreen --noerrdialogs --disable-infobars 'https://techgeek.biz' 'https://quick-time-management.com' 'https://average-athlete.com' 'https://techgeek.biz/raspberry-pi' 'https://fleet-track.org' 'https://github.com/LukeKeam' &


# Do loop, has a ping test just incase it is offline. Displays previous page rather than updating it and showing offline
while true; do
	if ping -c 1 google.com &> /dev/null; then
		# move tab
		xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab
		# refresh page
		xdotool keydown ctrl+F5; xdotool keyup ctrl+F5
		sleep 30
	else
		xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
		sleep 30
	fi

done
