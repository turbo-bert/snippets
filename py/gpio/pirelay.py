#!/usr/bin/python3


import time
import gpiozero

# newest:https://shop.sb-components.co.uk/products/pirelay-relay-board-shield-for-raspberry-pi
# rel1=gpio19
# rel2=gpio13
# rel3=gpio6
# rel4=gpio5

# 4 17 27 22
od = gpiozero.OutputDevice(22, active_high=True, initial_value=False)
od.on()
time.sleep(0.5)
od.off()
