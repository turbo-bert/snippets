default:
	ac compile --fqbn arduino:avr:uno Main
	ac upload --fqbn arduino:avr:uno -p /dev/ttyUSB0 Main

install:
	curl -L -o site.html 'https://arduino.github.io/arduino-cli/0.35/installation/'
	curl -L -O 'https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_ARM64.tar.gz'
	#curl -L -O 'https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_64bit.tar.gz'
	echo "tar cvfz that single executable into /usr/local/bin/ac manually"

init:
	ac core update-index
	ac board list
	ac core install arduino:avr
	ac core list

cat:
	stty -F /dev/ttyUSB0 raw 9600
	cat /dev/ttyUSB0

libs:
	ac lib install Servo
