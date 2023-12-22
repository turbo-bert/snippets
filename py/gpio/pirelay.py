#!/usr/bin/python3


import time
import gpiozero

# 4 17 27 22
od = gpiozero.OutputDevice(22, active_high=True, initial_value=False)
od.on()
time.sleep(0.5)
od.off()
