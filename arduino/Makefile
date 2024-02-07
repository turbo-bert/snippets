default:
	ac compile --fqbn arduino:avr:uno Main
	ac upload --fqbn arduino:avr:uno -p /dev/ttyACM0 Main

install:
	curl -L -o site.html 'https://arduino.github.io/arduino-cli/0.35/installation/'
	curl -L -O 'https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_ARM64.tar.gz'
	echo "tar cvfz that single executable into /usr/local/bin/ac manually"

init:
	ac core update-index
	ac board list
	ac core install arduino:avr
	ac core list
