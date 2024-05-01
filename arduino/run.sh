#!/bin/bash


arduino-cli compile --fqbn arduino:avr:uno Main
arduino-cli upload --fqbn arduino:avr:uno -p /dev/ttyACM0 Main
