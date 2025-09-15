import time
import gpiozero
#from apt install python3-gpiozero

# 4 17 27 22                                                                                                      
od = gpiozero.OutputDevice(5, active_high=True, initial_value=False)
od.on()
time.sleep(3)
od.off()
